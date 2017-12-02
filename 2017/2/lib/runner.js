import { each, min, find, max, sortArrayNumerically, chain } from "./utils";

const minMax = (arr) => (max(arr) - min(arr));

const firstDivisible = (arr) => {
  let found = null;
  each(arr, (value, index) => {
    find(arr, (val, idx2) => {
      let [lower, higher] = sortArrayNumerically([val, value]);
      if (higher % lower == 0 && index != idx2) {
        found = higher / lower;
        return;
      }
    });
  });
  return found;
};

export const part1 = (input) => {
  return chain(input)
    .map(minMax)
    .reduce((sum, value) => sum + value, 0)
    .value();
};

export const part2 = (input) => {
  return chain(input)
    .map(firstDivisible)
    .reduce((sum, value) => sum + value, 0)
    .value();
};
