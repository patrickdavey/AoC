import { chain } from "./utils";
import generator from "./generator";

export const part1 = (a, b) => {
  let generatorA = generator(16807, a, 40000000, 1);
  let generatorB = generator(48271, b, 40000000, 1);
  let done = false
  let matches = 0;
  while(true) {
    a = generatorA.next()
    b = generatorB.next()
    if (a.done) { break; }

    if (a.value == b.value) {
      matches += 1;
    }
  }

  return matches;

};

export const part2 = (a, b) => {
  let generatorA = generator(16807, a, 5000000, 4);
  let generatorB = generator(48271, b, 5000000, 8);
  let done = false
  let matches = 0;
  while(true) {
    a = generatorA.next()
    b = generatorB.next()
    if (a.done) { break; }

    if (a.value == b.value) {
      matches += 1;
    }
  }

  return matches;

};
