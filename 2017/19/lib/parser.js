import { chain, each, reduce } from "./utils";

const reducer = (acc, value, row) => {
  const chars = value.split("");
  each(chars, (c, col) => {
    acc[`${col},${row}`] = c
    if ((row == 0) && c == "|"){
      acc["start"] = [col, 0];
    }
  });
  return acc;
}


export const parse = (raw) => {
  return chain(raw)
    .thru(r => r.split("\n"))
    .thru(lines => reduce(lines, reducer, {}))
    .value();
};
