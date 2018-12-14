class Runner():
  def __init__(self):
    self.elf_1_index = 0
    self.elf_2_index = 1
    self.all_recipes = [3, 7]

  def part1(self, length):
    while len(self.all_recipes) < length + 10:
      self.add_new_recipe()
      self.step_elves_forward()

    return "".join(map(str, self.all_recipes[length:length+10]))

  def part2(self, looking_for):
    check = list(map(int, looking_for))
    check_length = len(check)
    while True:
      self.add_new_recipe()
      self.step_elves_forward()
      if self.all_recipes[-check_length:] == check:
        return len(self.all_recipes) - check_length
      elif self.all_recipes[-(check_length + 1):-1] == check:
        return len(self.all_recipes) - (len(check)) -1

  def add_new_recipe(self):
    new_recipe = str(self.all_recipes[self.elf_1_index] + self.all_recipes[self.elf_2_index])
    for digit in new_recipe:
      self.all_recipes.append(int(digit))

  def step_elves_forward(self):
    self.elf_1_index = (self.elf_1_index + self.all_recipes[self.elf_1_index] + 1) % len(self.all_recipes)
    self.elf_2_index = (self.elf_2_index + self.all_recipes[self.elf_2_index] + 1) % len(self.all_recipes)

# guessed 552860567 for part 2, too high! (which means we've gone past the damn thing)
