import { unzip } from "lodash";
var Combinatorics = require('js-combinatorics');

const transpose = (matrix) => unzip(matrix);
const permutation = Combinatorics.permutation;
const combination = Combinatorics.combination;

export  { transpose, permutation, combination };
