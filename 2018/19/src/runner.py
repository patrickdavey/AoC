import re
from operator import itemgetter
from collections import defaultdict, namedtuple

factors = []

def speciala(R):
  if R[1] % R[3] == 0:
    factors.append(R[3])
    print(factors)
    R[0] = R[0] + R[3]
  R[4] = 0
  R[2] = R[1]

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

    for line in lines:
      registers = extract_ints(line)
      inst = Instruction(line.split(" ")[0], *registers)
      self.instructions.append(inst)

  def part1(self):
    while True:
      (instruction, arga, argb, destination) = self.instructions[self.instruction_pointer]
      self.registers[self.instruction_register] = self.instruction_pointer
      globals()[instruction](self.registers, arga, argb, destination)
      self.instruction_pointer = self.registers[self.instruction_register]
      self.instruction_pointer += 1
      if self.instruction_pointer >= len(self.instructions):
        return self.registers[0]

  def part2(self):
    self.instruction_pointer = 0
    self.registers = defaultdict(int)
    self.registers[0] = 1
    t = 0
    while True:
      (instruction, arga, argb, destination) = self.instructions[self.instruction_pointer]
      if self.instruction_pointer == 2 and self.registers[3] != 0:
        speciala(self.registers)
        self.instruction_pointer = 12
      else:
        self.registers[self.instruction_register] = self.instruction_pointer
        globals()[instruction](self.registers, arga, argb, destination)
        self.instruction_pointer = self.registers[self.instruction_register]
        self.instruction_pointer += 1

      if self.instruction_pointer >= len(self.instructions):
        return self.registers[0]
