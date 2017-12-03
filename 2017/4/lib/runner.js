import { chain } from "./utils";
import { valid, validForAnagrams } from "./password_validator";

export const part1 = (input) => {
  return chain(input)
    .filter(valid)
    .thru((validInputs) => validInputs.length)
    .value();
};

export const part2 = (input) => {
  return chain(input)
    .filter(validForAnagrams)
    .thru((validInputs) => validInputs.length)
    .value();
};
