import { cycleGenerator } from "../lib/cycle";

export const part1 = (input) => {
  let gen = cycleGenerator(input);
  let seenBefore = {};
  let steps = 0;
  seenBefore[input] = true;
  input = gen.next().value
  while(!seenBefore[input]) {
    seenBefore[input] = true;
    steps += 1;
    input = gen.next().value
  }

  return {
    stepsTaken: steps + 1,
    duplicate: input
  };
};

export const part2 = (input) => {
  let duplicate = part1(input).duplicate;
  return part1(duplicate);
};
