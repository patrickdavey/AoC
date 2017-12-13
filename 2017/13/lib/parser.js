import { isUndefined, forEach, mapValues } from "lodash";
import { max, keys, chain, intoLines, reduce } from "./utils";

const matchNumbers = line => line.match(/\d+/g);

const getScanners = (acc, match) => {
  const depth = Number(match[1]);
  acc[match[0]] = {
    depth,
    position: 0,
    direction: "forward"
  };
  return acc;
};

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(matchNumbers)
    .thru(matches => reduce(matches, getScanners, {}))
    .value();
};
