import string
import re
from collections import Counter

class Runner():
  def part1(self, test):
    finished = False
    length = len(test)
    while (finished == False):
      for char in string.ascii_lowercase:
        upper_char = char.upper()
        replace = f"{char}{upper_char}"
        test = test.replace(replace, "")
        test = test.replace(replace[::-1], "")

      if len(test) == length:
        finished = True
      else:
        length = len(test)
    return len(test)

  def part2(self, input):
    counter = Counter()
    for char in string.ascii_lowercase:
      stringToTest = input
      pattern = re.compile(char, re.IGNORECASE)
      stringToTest = pattern.sub("", stringToTest)
      size = self.part1(stringToTest)
      counter[char] = size

    (_letter, size) = counter.most_common()[-1]
    return size
