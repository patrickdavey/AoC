from collections import defaultdict, Counter

class Runner():
  def __init__(self, num_players, final_marble):
    self.num_players = num_players
    self.final_marble = final_marble
    self.circle = [0]
    self.current_marble = 0
    self.players = defaultdict(int)
    self.current_player = -1

  def part1(self):
    for i in range(1, self.final_marble + 1):
      self.current_player = (self.current_player + 1) % self.num_players
      if len(self.circle) == 1:
        self.circle.append(i)
        self.current_marble = i
      elif i % 23 == 0:
        self.players[self.current_player] += i
        index_of_current = self.circle.index(self.current_marble)
        seven_counter_clockwise_value = self.circle[(index_of_current - 7) % len(self.circle)]
        six_couter_clockwise_value = self.circle[(index_of_current - 6) % len(self.circle)]
        self.players[self.current_player] += seven_counter_clockwise_value
        self.circle.remove(seven_counter_clockwise_value)
        self.current_marble = six_couter_clockwise_value
      else:
        index_of_current = self.circle.index(self.current_marble)
        one_clockwise = (index_of_current + 1) % len(self.circle)
        two_clockwise = (index_of_current + 2) % len(self.circle)
        self.circle.insert(two_clockwise, i)
        self.current_marble = i

    return max(self.players.values())

  def part2(self):
    return True
