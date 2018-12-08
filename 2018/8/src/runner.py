# from collections import defaultdict, namedtuple
# Node = namedtuple("Node", "num_children num_metadata
import resource, sys
resource.setrlimit(resource.RLIMIT_STACK, (2**29,-1))
sys.setrecursionlimit(10**6)

class Runner():
  def __init__(self, raw):
    self.raw = list(map(int, raw.strip().split(" ")))
    self.all_nodes = []

  def part1(self):
    self.find_all_nodes(None, self.raw)
    acc = 0
    for node in self.all_nodes:
      for metadata in node["metadata_entries"]:
        acc += metadata

    return acc

  def part2(self):
    if self.all_nodes == []:
      self.find_all_nodes(None, self.raw)

    return self.find_total(self.all_nodes[0], 0)


  def find_all_nodes(self, current_node, remainder):
    if len(remainder) == 0:
      return
    elif current_node == None:
      # initial setup
      node = self.get_node(None, remainder)
      self.find_all_nodes(node, remainder)
    else:
      if current_node["num_child_nodes"] == len(current_node["child_nodes"]):
        for i in range(0, current_node["num_metadata_entries"]):
          current_node["metadata_entries"].append(remainder.pop(0))
        self.find_all_nodes(current_node["parent"], remainder)
      else:
        child = self.get_node(current_node, remainder)
        current_node["child_nodes"].append(child)
        self.find_all_nodes(child, remainder)

  def find_total(self, node, acc):
    if node["num_child_nodes"] == 0:
      return sum(node["metadata_entries"])
    else:
      for entry in node["metadata_entries"]:
        if entry > 0:
          try:
            acc += self.find_total(node["child_nodes"][entry -1], 0)
          except IndexError:
            acc += 0
      return acc

  def get_node(self, parent, string):
    num_child_nodes = string.pop(0)
    num_metadata_entries = string.pop(0)
    node = {
        "num_child_nodes": num_child_nodes,
        "num_metadata_entries": num_metadata_entries,
        "child_nodes": [],
        "metadata_entries": [],
        "parent": parent
    }
    self.all_nodes.append(node)
    return node
