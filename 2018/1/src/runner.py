def lines(string):
  return string.strip().split("\n")

def run(input = None):
  input = Input() if input is None else input
  answer = 0
  instructions = ['answer {}'.format(line) for line in lines(input)]

  for instruction in instructions:
    answer = eval(instruction)

  return answer

def run2(input = None):
  input = Input() if input is None else input
  answer = 0
  found = {}
  instructions = ['answer {}'.format(line) for line in lines(input)]
  while True:
    for instruction in instructions:
      answer = eval(instruction)
      if answer in found:
        return answer
      else:
        found[answer] = True
