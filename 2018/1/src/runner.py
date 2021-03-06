import itertools

def lines(string):
  return string.strip().split("\n")

def numbers(input):
  return [int(line) for line in lines(input)]

def run(input):
  return sum(numbers(input))

def run2(input):
  answer = 0
  found = set([0])

  for number in itertools.cycle(numbers(input)):
    answer += number
    if answer in found:
      return answer
    else:
      found.add(answer)
