import { chain, filter } from "./utils";

const removeCancelled = s => s.replace(/!./g, "")
const removeGarbage = s => s.replace(/<[^>]+>/g, "")

const countScore = (string) => {
  let level = 0;
  let sum = 0;

  for (const char of Array(...string)) {
    if (char === "{") {
      level += 1;
      sum += level;
    } else if (char === "}") {
      level -= 1;
    }
  }

  return sum;
};

const extractGarbage = s => s.match(/<[^>]*>/g)

export const part1 = (input) => {
  return chain(input)
    .thru(removeCancelled)
    .thru(removeGarbage)
    .thru(countScore)
    .value();
};

export const part2 = (input) => {
  return chain(input)
    .thru(removeCancelled)
    .thru(extractGarbage)
    .map(g => g.length - 2)
    .reduce((sum, value) => sum + value, 0)
    .value();
};
