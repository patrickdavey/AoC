import {
  includes,
  reject,
  flattenDepth,
  cloneDeep,
  chunk,
  chain,
  filter,
  slice,
  map,
  keys,
  isUndefined,
  difference,
  each,
  find,
  flatten,
  reduce,
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

const calulateXOR = array => reduce(array, (acc, val) => acc ^ val);

const toHex = number => `00${number.toString(16)}`.slice(-2);

const knot = (input) => {
  let array = [...Array(256).keys()]
  let lengths = ascii(input);
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


const charMap = {
  0: "0000",
  1: "0001",
  2: "0010",
  3: "0011",
  4: "0100",
  5: "0101",
  6: "0110",
  7: "0111",
  8: "1000",
  9: "1001",
  a: "1010",
  b: "1011",
  c: "1100",
  d: "1101",
  e: "1110",
  f: "1111"
}

const hexToBits = (string) => {
  return string.split('').map(function (char) {
    return charMap[char];
  }).join('');
}

const KNOT_SUFFIX = [17, 31, 73, 47, 23];

const ascii = (s) => {
  let ascii = map(s.split(""), c => c.charCodeAt(0));
  ascii.push(...KNOT_SUFFIX)
  return ascii;
}

function reverseSlice(array, length, offset) {
  const mapSlice = [];
  for (let i = length - 1; i > -1; i -= 1) {
    mapSlice.push(array[(offset + i) % array.length]);
  }

  each(mapSlice, (val, index) => array[(index + offset) % array.length] = val);
  return array;
}

function* hashGenerator(arr, lens, rnds = 1) {
  let array = arr;
  const lengths = lens;
  let inc = 0;
  let currentPosition = 0;
  let skipSize = 0;
  let rounds = rnds;


  while (rounds > 0) {
    const length = lengths[inc];
    array = reverseSlice(array, length, currentPosition);
    currentPosition = (currentPosition + length + skipSize) % array.length;
    skipSize += 1;
    inc += 1;

    if (inc === lengths.length) {
      rounds -= 1;
      inc = 0;
    }

    if (rounds > 0) {
      yield (array);
    }
  }

  return array;
}
export {
  bin,
  hexToBits,
  chain,
  charCount,
  combination,
  each,
  find,
  flatten,
  intoLines,
  join,
  max,
  min,
  permutation,
  reduce,
  sort,
  sortArrayNumerically,
  sortLettersInWord,
  split,
  splitByWhitespace,
  toDecimal,
  isUndefined,
  difference,
  transpose,
  keys,
  trim,
  map,
  filter,
  slice,
  reject,
  knot,
  chunk,
  flattenDepth,
  includes,
  cloneDeep,
  uniq
};
