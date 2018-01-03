import { split, chain, intoLines, trim } from "./utils";

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(l => trim(l))
    .map(l => split(l, "/"))
    .value();
};
