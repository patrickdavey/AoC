import { chain, intoLines, reduce, trim, toDecimal } from "./utils";

const intoStructure = (acc, line) => {
  const nameWeight = line.match(/^(\w+) \((\d+)\)/);
  const name = nameWeight[1];
  const weight = toDecimal(nameWeight[2]);
  let children = [];
  if (/->/.test(line)) {
    children = line.split("->")[1].trim().match(/\w+/g);
  }

  acc[name] = {
    name,
    weight,
    children,
  };
  return acc;
};

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(trim)
    .reduce(intoStructure, {})
    .value();
};
