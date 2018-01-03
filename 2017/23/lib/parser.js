import { chain, intoLines } from "./utils";

const intoInstructions = string => {
  let match = null;
  if (match = string.match(/jnz (\d) ([-\d]+)/)) {
    return {
      instruction: "jnz",
      args: [Number(match[1]), Number(match[2])],
    };
  }
  if (match = string.match(/(jnz|mod|add|set|mul|sub) (\w) ([-\d]+)/)) {
    return {
      instruction: match[1],
      args: [match[2], Number(match[3])],
    };
  }

  if (match = string.match(/(add|jnz|mod|set|mul|sub) (\w) (\w)/)) {
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
