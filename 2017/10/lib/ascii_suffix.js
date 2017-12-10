import { flatten, map, split } from "./utils";
const SUFFIX = [17, 31, 73, 47, 23];

export const asciiSuffix = (s) => {
  let ascii = map(s.split(""), c => c.charCodeAt(0));
  ascii.push(...SUFFIX)
  return ascii;
}
