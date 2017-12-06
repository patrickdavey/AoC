import { cycle } from "../lib/cycle";

export const part1 = (input) => {
  let seenBefore = {};
  let steps = 0;
  seenBefore[input] = true;
  input = cycle(input);
  while(!seenBefore[input]) {
    seenBefore[input] = true;
    steps += 1;
    input = cycle(input);
  }

  return steps + 1;
};

export const part2 = (input) => {
  part1(input);
  return part1(input);
};
