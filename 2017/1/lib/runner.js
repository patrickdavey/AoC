import { toDecimal } from "./utils"
import { map, reduce, thru } from 'lodash'
import flow from 'lodash/fp/flow'
import curry from 'lodash/fp/curry'
import convert from 'lodash/fp/convert'

let fp = convert({
   map, reduce, thru
})

const iteratreeMap = fp.map.convert({cap: false})

const DUPLICATE_MATCH = /(.)(?=\1)/g

const addEndToBeginning = (string) => {
  return string + string[0]
}

const duplicates = (string) => {
  return string.match(DUPLICATE_MATCH);
}

const halfwayMatch = (value, index, collection) => {
  let offset = collection.length / 2;
  return value === collection[(index + offset) % collection.length] ? toDecimal(value) : 0;
}

export const part1 = (input) => {
  return flow(
        fp.thru(addEndToBeginning),
        fp.thru(duplicates),
        fp.map(toDecimal),
        fp.reduce((sum, value) => sum + value, 0)
  )(input)
}

export const part2 = (input) => {
  return flow(
        iteratreeMap(halfwayMatch),
        fp.reduce((sum, value) => sum + value, 0)
  )(input)
}
