import re
from machine import addr, addi, mulr, muli, banr, bani, borr, bori, setr, seti, gtir, gtri, gtrr, eqri, eqir, eqrr

def extract_ints(a_string):
  return list(map(int, re.findall(r'-?\d+', a_string)))

def matches_addr(instruction, before, after):
  addr(before, *instruction[1:])
  return before == after

def matches_addi(instruction, before, after):
  addi(before, *instruction[1:])
  return before == after

def matches_mulr(instruction, before, after):
  mulr(before, *instruction[1:])
  return before == after

def matches_muli(instruction, before, after):
  muli(before, *instruction[1:])
  return before == after

def matches_banr(instruction, before, after):
  banr(before, *instruction[1:])
  return before == after

def matches_bani(instruction, before, after):
  bani(before, *instruction[1:])
  return before == after

def matches_borr(instruction, before, after):
  borr(before, *instruction[1:])
  return before == after

def matches_bori(instruction, before, after):
  bori(before, *instruction[1:])
  return before == after

def matches_setr(instruction, before, after):
  setr(before, *instruction[1:])
  return before == after

def matches_seti(instruction, before, after):
  seti(before, *instruction[1:])
  return before == after

def matches_gtir(instruction, before, after):
  gtir(before, *instruction[1:])
  return before == after

def matches_gtri(instruction, before, after):
  gtri(before, *instruction[1:])
  return before == after

def matches_gtrr(instruction, before, after):
  gtrr(before, *instruction[1:])
  return before == after

def matches_eqir(instruction, before, after):
  eqir(before, *instruction[1:])
  return before == after

def matches_eqri(instruction, before, after):
  eqri(before, *instruction[1:])
  return before == after

def matches_eqrr(instruction, before, after):
  eqrr(before, *instruction[1:])
  return before == after

class Checker:
  def __init__(self, lines, possibles):
    assert(len(lines) == 3)
    self.before = extract_ints(lines[0])
    self.instruction = extract_ints(lines[1])
    self.after = extract_ints(lines[2])
    self.possibles = possibles

  def matches(self):
    count = 0
    if matches_addr(self.instruction, self.before.copy(), self.after):
      count += 1
      self.possibles[self.instruction[0]].add("addr")
    if matches_addi(self.instruction, self.before.copy(), self.after):
      count += 1
      self.possibles[self.instruction[0]].add("addi")
    if matches_mulr(self.instruction, self.before.copy(), self.after):
      count += 1
      self.possibles[self.instruction[0]].add("mulr")
    if matches_muli(self.instruction, self.before.copy(), self.after):
      count += 1
      self.possibles[self.instruction[0]].add("muli")
    if matches_banr(self.instruction, self.before.copy(), self.after):
      count += 1
      self.possibles[self.instruction[0]].add("banr")
    if matches_bani(self.instruction, self.before.copy(), self.after):
      count += 1
      self.possibles[self.instruction[0]].add("bani")
    if matches_borr(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("borr")
      count += 1
    if matches_bori(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("bori")
      count += 1
    if matches_setr(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("setr")
      count += 1
    if matches_seti(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("seti")
      count += 1
    if matches_gtir(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("gtir")
      count += 1
    if matches_gtri(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("gtri")
      count += 1
    if matches_gtrr(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("gtrr")
      count += 1
    if matches_eqir(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("eqir")
      count += 1
    if matches_eqri(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("eqri")
      count += 1
    if matches_eqrr(self.instruction, self.before.copy(), self.after):
      self.possibles[self.instruction[0]].add("eqrr")
      count += 1
    return count

