import { find, trim, min, max, unzip, chain, flatten, each } from "lodash";
var Combinatorics = require("js-combinatorics");

const transpose = (matrix) => unzip(matrix);
const bin = (number) => number.toString(2);
const charCount = (string, char) => (string.match(RegExp(char, "g")) || []).length;
const permutation = Combinatorics.permutation;
const combination = Combinatorics.combination;
const toDecimal = (s) => Number.parseInt(s, 10);
const sortArrayNumerically = (arr) => arr.sort((a, b) => a - b);

export  { find, trim, sortArrayNumerically, min, max, transpose, permutation, flatten, combination, bin, charCount, chain, toDecimal, each };
