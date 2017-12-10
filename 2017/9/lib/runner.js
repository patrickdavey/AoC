import { chain, filter } from "./utils";

const removeCancelled = s => s.replace(/!./g, "")
const removeGarbage = s => s.replace(/<[^>]+>/g, "")

const countScore = (string) => {
  const splitString = Array(...string);
  let level = 0;
  let sum = 0;
  for (let i = 0; i < splitString.length; i++ ){
    if (splitString[i] == "{") {
      level += 1;
      sum = sum + level;
    } else if (splitString[i] == "}") {
      level -= 1;
    }
  }

  return sum;
};
export const part1 = (input) => {
  return chain(input)
    .thru(removeCancelled)
    .thru(removeGarbage)
    .thru(countScore)
    .value();
};

export const part2 = (input) => {
  return chain(input)
    .thru(removeCancels)
    .thru((s) => countGarbage(s, 0, 0))
    .value();
};
