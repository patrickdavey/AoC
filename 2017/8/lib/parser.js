import { chain, trim, intoLines } from "./utils";

const intoRegex = line => /^(\w+) (dec|inc) ([\d-]+) if (\w+) (.*)$/.exec(line);

const intoStructure = matchGroup => {
  let operation = matchGroup[2] == "dec" ? "-=" : "+=";
  return `if(registers["${matchGroup[4]}"] ${matchGroup[5]}) { registers["${matchGroup[1]}"] ${operation} ${matchGroup[3]}}`;
}

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(trim)
    .map(intoRegex)
    .map(intoStructure)
    .value();
};
