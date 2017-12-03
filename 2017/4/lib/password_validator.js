import { sortLettersInWord, splitByWhitespace, split, uniq, join, chain } from "./utils";

const validPassword = (words) => words.length === uniq(words).length;

export const valid = (raw) => {
  return chain(raw)
    .thru(splitByWhitespace)
    .thru(validPassword)
    .value();
};

export const validForAnagrams = (raw) => {
  return chain(raw)
    .thru(splitByWhitespace)
    .map(sortLettersInWord)
    .thru(validPassword)
    .value();
};
