from collections import defaultdict, Counter

class Node():
  def __init__(self, data):
    self.data = data
    self.prev = self
    self.next = self

class Runner():
  def __init__(self, num_players, final_marble):
    self.num_players = num_players
    self.final_marble = final_marble
    self.current_player = -1
    self.players = defaultdict(int)
    node = Node(0)
    self.head = node
    self.current_node = node

  def part1(self):
    for i in range(1, self.final_marble + 1):
      self.current_player = (self.current_player + 1) % self.num_players
      if i % 23 == 0:
        self.players[self.current_player] += i
        node_to_remove = self.current_node.prev.prev.prev.prev.prev.prev.prev
        self.players[self.current_player] += node_to_remove.data
        node_to_remove.prev.next = node_to_remove.next
        node_to_remove.next.prev = node_to_remove.prev.next
        self.current_node = node_to_remove.next

      else:
        # can always just insert after next
        new_node = Node(i)
        insert_after = self.current_node.next
        insert_before = self.current_node.next.next

        insert_after.next = new_node
        insert_before.prev = new_node
        new_node.next = insert_before
        new_node.prev = insert_after
        self.current_node = new_node
    return max(self.players.values())
