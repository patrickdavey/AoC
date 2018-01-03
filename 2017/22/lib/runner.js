import { chain } from "./utils";
import { virusGenerator } from "./virus";

export const part1 = (initialGrid, count) => {
  let virus = virusGenerator(initialGrid);
  let value = null

  for (let i = 0; i < count; i += 1) {
    value = virus.next().value
  }

  return value;
};

export const part2 = (input) => {
};
