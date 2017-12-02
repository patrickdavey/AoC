import { split, map, trim } from "lodash";
import { toDecimal, chain } from "./utils"

const intoLines = (input) => split(trim(input), "\n")
const splitByWhitespace = (input) => trim(input).split(/\s+/)
const arrayIntoDecimals = (input) => map(input, toDecimal)

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(splitByWhitespace)
    .map(arrayIntoDecimals)
    .value()
}
