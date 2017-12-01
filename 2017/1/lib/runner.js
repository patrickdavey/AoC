import { chain, flatten } from "./utils"

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

const halfwayMatch = (value, index, collection) => {
  let offset = collection.length / 2;
  return value === collection[(index + offset) % collection.length] ? toDecimal(value) : 0;
}

export const part1 = (input) => {
  return chain(input)
        .thru(addEndToBeginning)
        .thru(duplicates)
        .map(toDecimal)
        .reduce((sum, value) => sum + value, 0)
        .value()
}

export const part2 = (input) => {
  return chain([...input])
        .map(halfwayMatch)
        .reduce((sum, value) => sum + value, 0)
        .value()
}
