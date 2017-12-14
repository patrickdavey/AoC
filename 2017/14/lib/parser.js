import { knot, chain, trim, hexToBits } from "./utils";

const appendSuffixes = (word) => {
  return [...Array(128).keys()].map(i => `${word}-${i}`);
}

export const parse = (raw) => {
  return chain(raw)
    .thru(trim)
    .thru(appendSuffixes)
    .map(knot)
    .map(hexToBits)
    .value();
};
