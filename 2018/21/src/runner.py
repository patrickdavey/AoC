import re
from operator import itemgetter
from collections import defaultdict, namedtuple

seen = set()
factors = []

def addr(R, a, b, c):
  R[c] = R[a] + R[b]

def addi(R, a, b, c):
   R[c] = R[a] + b

def setr(R, a, b, c):
   R[c] = R[a]

def seti(R, a, b, c):
   R[c] = a

def mulr(R, a, b, c):
   R[c] = R[a] * R[b]

def muli(R, a, b, c):
   R[c] = R[a] * b

def banr(R, a, b, c):
   R[c] = R[a] & R[b]

def bani(R, a, b, c):
   R[c] = R[a] & b

def borr(R, a, b, c):
   R[c] = R[a] | R[b]

def bori(R, a, b, c):
   R[c] = R[a] | b

def gtir(R, a, b, c):
   R[c] = 1 if(a > R[b]) else 0

def gtri(R, a, b, c):
   R[c] = 1 if(R[a] > b) else 0

def gtrr(R, a, b, c):
   R[c] = 1 if(R[a] > R[b]) else 0

def eqir(R, a, b, c):
   R[c] = 1 if(a == R[b]) else 0

def eqri(R, a, b, c):
   R[c] = 1 if(R[a] == b) else 0

def eqrr(R, a, b, c):
  if R[a] not in seen:
    seen.add(R[a])
    R["last"] = R[a]
    R["check"] += 1
    print(R["check"])
  else:
    print(R["last"])
    assert(False)

  R[c] = 1 if(R[a] == R[b]) else 0


def extract_ints(a_string):
    return tuple(map(int, re.findall(r'-?\d+', a_string)))

Instruction = namedtuple("Instruction", "call, a, b, c")

class Runner():
  def __init__(self, raw):
    lines = raw.splitlines()
    instruction_register = extract_ints(lines.pop(0))
    self.instruction_register = itemgetter(0)(instruction_register)
    self.instructions = []
    self.instruction_pointer = 0
    self.registers = defaultdict(int)
    self.registers[0] = 0
    print("instruction_register", self.instruction_register)
    print("instruction_pointer", self.instruction_register)
    self.registers["check"] = 0

    for line in lines:
      registers = extract_ints(line)
      inst = Instruction(line.split(" ")[0], *registers)
      self.instructions.append(inst)


  def part1(self):
    # calculate 0
    finished = False
    initial = 0

    # while finished == False:
    #   finished = self.calculate()
    #   initial += 1
    #   self.instruction_pointer = 0
    #   self.registers = defaultdict(int)
    #   print("trying again with:", initial)
    #   self.registers[0] = initial - 1

    # print(finished)
    finished = self.calculate()


  def calculate(self):
    instructions_run = 0
    while True:
      (instruction, arga, argb, destination) = self.instructions[self.instruction_pointer]
      self.registers[self.instruction_register] = self.instruction_pointer
      globals()[instruction](self.registers, arga, argb, destination)
      instructions_run += 1
      self.instruction_pointer = self.registers[self.instruction_register]
      self.instruction_pointer += 1
      if self.instruction_pointer >= len(self.instructions):
        return instructions_run
