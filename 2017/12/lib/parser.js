import { toDecimal, chain, intoLines, reduce } from "./utils";

const getMatch = line => /(\d+) <-> (.*)/.exec(line)

const reducer = (acc, pipeInfo) => {
  let pipeId = toDecimal(pipeInfo[1]);
  let otherPipes = pipeInfo[2].match(/\d+/g);
  acc[pipeId] = otherPipes;
  return acc
}

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(getMatch)
    .thru(pipes => reduce(pipes, reducer, {}))
    .value();
};
