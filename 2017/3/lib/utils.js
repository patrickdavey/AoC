import { unzip, chain, flatten } from "lodash";
var Combinatorics = require('js-combinatorics');

const transpose = (matrix) => unzip(matrix);
const bin = (number) => number.toString(2)
const charCount = (string, char) => (string.match(RegExp(char, "g")) || []).length
const permutation = Combinatorics.permutation;
const combination = Combinatorics.combination;
const toDecimal = (s) => Number.parseInt(s, 10)

export  { transpose, permutation, flatten, combination, bin, charCount, chain, toDecimal };
