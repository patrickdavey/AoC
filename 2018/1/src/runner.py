def lines(string):
  return string.strip().split("\n")

def run(input = None):
  input = Input() if input is None else input
  answer = 0
  instructions = ['answer {}'.format(line) for line in lines(input)]

  for instruction in instructions:
    answer = eval(instruction)

  return answer
