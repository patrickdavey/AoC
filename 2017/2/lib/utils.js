import { find, trim, min, max, unzip, chain, flatten, each, map, split } from "lodash";
var Combinatorics = require("js-combinatorics");

const transpose = (matrix) => unzip(matrix);
const bin = (number) => number.toString(2);
const charCount = (string, char) => (string.match(RegExp(char, "g")) || []).length;
const permutation = Combinatorics.permutation;
const combination = Combinatorics.combination;
const toDecimal = (s) => Number.parseInt(s, 10);
const sortArrayNumerically = (arr) => arr.sort((a, b) => a - b);
const intoLines = (input) => split(trim(input), "\n");
const splitByWhitespace = (input) => trim(input).split(/\s+/);
const arrayIntoDecimals = (input) => map(input, toDecimal);

export  {
  arrayIntoDecimals,
  bin,
  chain,
  charCount,
  combination,
  each,
  find,
  flatten,
  intoLines,
  map,
  max,
  min,
  permutation,
  sortArrayNumerically,
  split,
  splitByWhitespace,
  toDecimal,
  transpose,
  trim
};
