import { clone } from "./utils";
import * as spinMoves from "./dance_moves";

export const part1 = (instructions, array) => {
  for (let i = 0; i < instructions.length; i += 1) {
    const instruction = instructions[i];
    spinMoves[instruction.name].apply(null, [array, ...instruction.args]);
  }
  return array.join("");
};

const firstRepeatedDance = (instructions, array) => {
  const seenBefore = {};
  let i = 0;
  while (true) {
    const dance = part1(instructions, array);
    if (seenBefore[dance]) {
      return i;
    }
    seenBefore[dance] = true;
    i += 1;
  }
};

export const part2 = (instructions, array, dances) => {
  const original = clone(array);

  const repeatedAt = firstRepeatedDance(instructions, array);

  array = original;
  for (let i = 0; i < dances % repeatedAt; i += 1) {
    part1(instructions, array);
  }

  return array.join("");
};
