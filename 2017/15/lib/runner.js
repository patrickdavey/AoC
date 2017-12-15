import generator from "./generator";

const countUntilFinished = (genA, genB) => {
  let matches = 0;
  while (true) {
    const a = genA.next();
    const b = genB.next();

    if (a.done) { return matches; }

    if (a.value === b.value) {
      matches += 1;
    }
  }
};

export const part1 = (a, b) => {
  const generatorA = generator(16807, a, 40000000, 1);
  const generatorB = generator(48271, b, 40000000, 1);

  return countUntilFinished(generatorA, generatorB);
};

export const part2 = (a, b) => {
  const generatorA = generator(16807, a, 5000000, 4);
  const generatorB = generator(48271, b, 5000000, 8);
  return countUntilFinished(generatorA, generatorB);
};
