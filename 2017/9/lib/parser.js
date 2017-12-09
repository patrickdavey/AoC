import { chain, intoLines } from "./utils";

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .value();
};
