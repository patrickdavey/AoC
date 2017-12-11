import { intoBuckets, findShortest } from "./hex_helper";
import { chain } from "./utils";

export const part1 = (input) => {
  return chain(input)
    .thru(intoBuckets)
    .thru(findShortest)
    .value();
};

export const part2 = (input) => {
  let max = 707;

  for (let i = 707; i < input.length; i += 1) {
    const travel = input.slice(0, i);
    const distance = part1(travel);
    if (distance > max) {
      max = distance;
    }
  }

  return max;
};
