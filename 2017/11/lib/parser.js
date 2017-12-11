import { chain, split, intoLines } from "./utils";

export const parse = (raw) => {
  return chain(raw)
    .thru(s => split(s, ","))
    .value();
};
