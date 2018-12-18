import re;
from collections import defaultdict

def addr(R, a, b, c):
   R[c] = R[a] + R[b]

def addi(R, a, b, c):
   R[c] = R[a] + b

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

def setr(R, a, b, c):
   R[c] = R[a]

def seti(R, a, b, c):
   R[c] = a

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


class Machine:
  def __init__(self, seq, instruction_codes):
    self.codes = instruction_codes
    self.instructions = [list(map(int, re.findall(r'-?\d+', s))) for s in seq]
    self.registers = defaultdict(int)

  def execute(self):
    for (instruction, arga, argb, destination) in self.instructions:
      globals()[self.codes[instruction]](self.registers, arga, argb, destination)

    return self.registers[0]
