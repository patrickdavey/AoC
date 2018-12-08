# Not my solution, based on https://www.reddit.com/r/adventofcode/comments/a47ubw/2018_day_8_solutions/ebc7w9i

class Runner():
  def sumtree(self, t):
      ch = t.pop(0)
      md = t.pop(0)
      return sum(self.sumtree(t) for _ in range(ch)) + sum(t.pop(0) for _ in range(md))

  def val(self, t):
      ch = t.pop(0)
      md = t.pop(0)
      vals = [self.val(t) for _ in range(ch)]
      mdata = [t.pop(0) for _ in range(md)]
      if ch == 0:
          return sum(mdata)
      return sum(vals[i-1] for i in mdata if i-1 in range(ch))

  def part1(self, input):
    self.raw = input
    return self.sumtree(self.raw)

  def part2(self, input):
    self.raw = input
    return self.val(self.raw)
