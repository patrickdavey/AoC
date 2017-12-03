import {
  arrayIntoDecimals,
  chain,
  intoLines,
  splitByWhitespace,
} from "./utils";


export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(splitByWhitespace)
    .map(arrayIntoDecimals)
    .value();
};
