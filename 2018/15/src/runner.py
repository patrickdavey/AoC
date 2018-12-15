from parser import Parser
from targeter import Targeter
from print_board import print_board
from run_order import run_order

class Runner():
  def __init__(self, raw):
    self.raw = raw.strip()
    self.elf_power = 3
    self.elves_must_not_die = False

  def reinit(self):
    self.state = Parser(self.raw)
    self.state.parse()

  def part1(self):
    self.reinit()
    battle = 0
    finished = False

    while finished == False:
      if self.elves_must_not_die and self.elves_left() < self.total_elves:
        return 0
      self.remove_dead()
      ordered_actors = run_order(self.state.actors)
      for (i, actor) in enumerate(ordered_actors):
        self.remove_dead()
        finished = self.process(actor)
        if finished:
          if i == len(ordered_actors):
            battle += 1
          else:
            still_remaining = False
            for j2 in range(i + 1, len(ordered_actors)):
              if ordered_actors[j2]["hit_points"] > 0:
                still_remaining = True
            if still_remaining == False:
              battle += 1
          return self.result(battle)

      finished = self.battle_finished()
      if finished:
        return self.result(battle + 1)
      battle += 1

    return True

  def battle_finished(self):
    alive = [a["type"] for a in self.state.actors]
    return len(set(alive)) == 1

  def result(self, battle):
    total = sum([a["hit_points"] for a in self.state.actors])
    return total * battle;

  def process(self, actor):
    if actor["hit_points"] <= 0:
      return
    if self.battle_finished():
      return True
    targeter = Targeter(self.state)
    enemies = self.close_to_enemy(actor)
    if enemies:
      pass
    else:
      action = targeter.best(actor, self.state.actors)
      if action == None:
        return
      (x, y) = action["location"]
      actor["x"] = x
      actor["y"] = y

    enemies = self.close_to_enemy(actor)
    if enemies:
      hit = 3
      if actor["type"] == "E":
        hit = self.elf_power
      self.fight_weakest(enemies, hit)
      self.remove_dead()
      if self.battle_finished():
        return True



  def close_to_enemy(self, actor):
    to_check = [a for a in self.state.actors if a["type"] != actor["type"] and a["id"] != actor["id"] ]
    in_range = [a for a in to_check if adjacent(actor, a)]
    return in_range


  def fight_weakest(self, enemies, hit):
    weakest = min(enemies, key=lambda e: e["hit_points"])
    weakest["hit_points"] -= hit

  def remove_dead(self):
    self.state.actors = [alive for alive in self.state.actors if alive["hit_points"] > 0]

  def elves_left(self):
    return sum([1 for e in self.state.actors if e["type"] == "E"])

  def part2(self):
    # 60080 too low
    # 61582 too low
    elves_win_no_death = False
    self.elves_must_not_die = True
    self.reinit()
    self.total_elves = self.elves_left()
    power = 3
    while elves_win_no_death == False:
      self.elf_power = power
      self.reinit()
      result = self.part1()
      if self.elves_left() == self.total_elves:
        return result
      else:
        power += 1

def manhattan_distance(point_a, point_b):
  (x1, y1) = point_a
  (x2, y2) = point_b
  return abs(x1 - x2) + abs(y1 - y2)

def adjacent(a, b):
  p1 = (a["x"], a["y"])
  p2 = (b["x"], b["y"])
  dist = manhattan_distance(p1, p2)
  return dist == 1
