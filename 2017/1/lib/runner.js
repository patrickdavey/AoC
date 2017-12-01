import { chain } from "./utils"

const DUPLICATE_MATCH = /(.)(?=\1)/g

const addEndToBeginning = (string) => {
  return string + string[0]
}

const duplicates = (string) => {
  return string.match(DUPLICATE_MATCH);
}

const toDecimal = (string) => {
  return Number.parseInt(string, 10);
}

export const part1 = (input) => {
  return chain(input)
        .thru(addEndToBeginning)
        .thru(duplicates)
        .map(toDecimal)
        .reduce((sum, value) => sum + value, 0)
        .value()
}
