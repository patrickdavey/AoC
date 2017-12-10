import { reduce, chunk } from "lodash";
import { chain } from "./utils";
import hashGenerator from "../lib/hasher";

const calulateXOR = array => reduce(array, (acc, val) => acc ^ val);

const toHex = number => `00${number.toString(16)}`.slice(-2);

export const part1 = (array, lengths) => {
  const testHash = hashGenerator(array, lengths, 1);
  let result = testHash.next();

  while (!result.done) { result = testHash.next(); }

  return result.value[0] * result.value[1];
};

export const part2 = (array, lengths) => {
  const testHash = hashGenerator(array, lengths, 64);
  let result = testHash.next();

  while (!result.done) { result = testHash.next(); }

  return chain(result.value)
    .thru(val => chunk(val, 16))
    .map(calulateXOR)
    .map(toHex)
    .join("")
    .value();
};

