import { split, trim, chain, intoLines, each } from "./utils";

const SWAP = /s(\d+)/;
const EXCHANGE = /x(\d+)\/(\d+)/;
const PARTNER = /p(\w)\/(\w)/;

const intoInstructions = (l) => {
  let match = l.match(SWAP);

  if (match) {
    return {
      name: "spin",
      args: [Number(match[1])],
    };
  }

  match = l.match(EXCHANGE);
  if (match) {
    return {
      name: "exchange",
      args: [Number(match[1]), Number(match[2])],
    };
  }

  match = l.match(PARTNER);
  if (match) {
    return {
      name: "partner",
      args: [match[1], match[2]],
    };
  }
};

export const parse = (raw) => {
  return chain(raw)
    .thru(r => split(r, ","))
    .map(trim)
    .map(intoInstructions)
    .value();
};
