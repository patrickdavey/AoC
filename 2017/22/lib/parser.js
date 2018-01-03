import { chain, each, intoLines, trim } from "./utils";

const intoMap = (acc, chars, row) => {
  each(chars, (char, col) => {
    acc[`${col},${row}`] = char;
  });
  return acc;
}

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(l => trim(l).split(""))
    .reduce(intoMap, {})
    .value();
};
