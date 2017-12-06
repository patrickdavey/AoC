import { chain, splitByWhitespace, toDecimal } from "./utils";

export const parse = (raw) => {
  return chain(raw)
    .thru(splitByWhitespace)
    .map(toDecimal)
    .value();
};
