import {
  isEmpty,
  chain,
  each,
  find,
  flatten,
  join,
  max,
  min,
  sort,
  split,
  trim,
  uniq,
  unzip
} from "lodash";

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
const sortLettersInWord = (word) => {
  return chain(word)
    .thru((word) => split(word, ""))
    .thru((letters) => letters.sort())
    .thru((letters) => join(letters, ""))
    .value();
};


export {
  bin,
  chain,
  charCount,
  combination,
  each,
  find,
  flatten,
  intoLines,
  isEmpty,
  join,
  max,
  min,
  permutation,
  sort,
  sortArrayNumerically,
  sortLettersInWord,
  split,
  splitByWhitespace,
  toDecimal,
  transpose,
  trim,
  uniq
};
