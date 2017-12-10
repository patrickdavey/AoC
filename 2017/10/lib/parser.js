import { chain, splitByWhitespace, toDecimal, split } from "./utils";

export const parse = (raw) => {
  return chain(raw)
    .thru((s) => split(s, ","))
    .map(toDecimal)
    .value();
};
