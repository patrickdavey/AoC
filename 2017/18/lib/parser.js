import { chain, intoLines } from "./utils";

const intoInstructions = string => {
  let match = null;
  if (match = string.match(/jgz (\d) ([-\d]+)/)) {
    return {
      instruction: "jgz",
      args: [Number(match[1]), Number(match[2])],
    };
  }
  if (match = string.match(/(jgz|mod|add|set|mul) (\w) ([-\d]+)/)) {
    return {
      instruction: match[1],
      args: [match[2], Number(match[3])],
    };
  }

  if (match = string.match(/(add|jgz|mod|set|mul) (\w) (\w)/)) {
    return {
      instruction: match[1],
      args: [match[2], match[3]],
    };
  }

  if (match = string.match(/snd (\d)/)) {
    return {
      instruction: "snd",
      args: [Number(match[1])],
    };
  }

  if (match = string.match(/(rcv|snd) (\w)/)) {
    return {
      instruction: match[1],
      args: [match[2]],
    };
  }

  throw `bad instruction ${string}`
};

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(intoInstructions)
    .value();
};
