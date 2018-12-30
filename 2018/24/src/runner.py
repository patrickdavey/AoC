from collections import defaultdict
import re
MATCHER = "(?P<units>\d+) units each with (?P<hits>\d+) hit points\s?(?P<immuneweak>\([\w, ;]+\))?\s?with an attack that does (?P<damagevalue>\d+) (?P<attack>\w+) damage at initiative (?P<initiative>\d+)"
POWERS = r"weak|slashing|immune|fire|radiation|bludgeoning|cold"

class Group():
  def __init__(self, info, group_type):
    self.units = int(info["units"])
    self.hits = int(info["hits"])
    self.initiative = int(info["initiative"])
    self.damage = int(info["damagevalue"])
    self.attack = info["attack"]
    self.immune = set()
    self.weak = set()
    self.attacking = None
    self.attacked_by = None
    self.group_type = group_type
    if info["immuneweak"]:
      stuff = re.findall(POWERS, info["immuneweak"])
      category = stuff.pop(0)
      while len(stuff) > 0:
        item = stuff.pop(0)
        if item == "weak" or item == "immune":
          category = item
        elif category == "weak":
          self.weak.add(item)
        else:
          self.immune.add(item)
  def effective_power(self):
    return self.units * self.damage
  def alive(self):
    return self.units > 0
  def boost(self, amount):
    self.damage += amount

  def damage_from(self, other):
    if other.attack in self.immune:
      return 0
    elif other.attack in self.weak:
      return other.effective_power() * 2
    else:
      return other.effective_power()

  def __repr__(self):
    return f"{self.initiative}: {self.units}(@{self.hits}), {self.effective_power()}, w: {self.weak}, im: {self.immune}, at: {self.attack}"
  def reset_attacking(self):
    self.attacking = None
    self.attacked_by = None

  def reduce_by(self, amount):
    self.units = self.units - amount // self.hits


def parse(string, group_type):
  info  = re.search(MATCHER, string).groupdict()
  return Group(info, group_type)


class Runner():
  def __init__(self, raw):
    sections = raw.split("Infection:")
    immunes = sections[0].strip().splitlines()[1:]
    infections = sections[1].strip().splitlines()
    self.goodies = [parse(immune, "goody") for immune in immunes]
    self.badies = [parse(infection, "baddy") for infection in infections]

  def part1(self):
    while len(self.goodies) > 0 and len(self.badies) > 0:
      self.target_selection()
      units_before_fight = sum([g.units for g in self.badies])
      self.fight_round()
      self.remove_dead()
      units_after_fight = sum([g.units for g in self.badies])

      if units_before_fight == units_after_fight:
        return False


    return sum([g.units for g in self.goodies + self.badies])

  def part2(self, amount):
    for goody in self.goodies:
      goody.boost(amount)

    result = self.part1()
    if result and len(self.goodies) > 0:
      return result
    else:
      return False

  def target_selection(self):
    combined = self.goodies + self.badies
    combined = sorted(combined, key=lambda g: (g.effective_power(), g.initiative), reverse=True)
    for attacker in combined:
      if attacker.group_type == "goody":
        possibles = [baddy for baddy in self.badies if baddy.damage_from(attacker) > 0 and baddy.attacked_by == None]
        if len(possibles) > 0:
          possibles = sorted(possibles, key=lambda g: (g.damage_from(attacker), g.effective_power(), g.initiative), reverse=True)
          target = possibles[0]
          attacker.attacking = target
          target.attacked_by = attacker

      else:
        possibles = [goody for goody in self.goodies if goody.damage_from(attacker) > 0 and goody.attacked_by == None]
        if len(possibles) > 0:
          possibles = sorted(possibles, key=lambda g: (g.damage_from(attacker), g.effective_power(), g.initiative), reverse=True)
          target = possibles[0]
          attacker.attacking = target
          target.attacked_by = attacker

  def fight_round(self):
    fighters = self.goodies + self.badies
    fighters = sorted(fighters, key=lambda g: g.initiative, reverse=True)
    fight_happened = False

    for fighter in fighters:
      if fighter.alive() and fighter.attacking:
        fight_happened = True
        damage_to_serve = fighter.attacking.damage_from(fighter)
        fighter.attacking.reduce_by(damage_to_serve)
    return fight_happened

  def remove_dead(self):
    self.goodies = [goody for goody in self.goodies if goody.alive()]
    self.badies = [baddy for baddy in self.badies if baddy.alive()]

    for fighter in self.goodies + self.badies:
      fighter.reset_attacking()


# guessed 82 was wrong
