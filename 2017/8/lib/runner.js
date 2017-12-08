import { map, values, max } from "./utils";

let allTimeMax = Number.MIN_VALUE;

const handler = {
  get(target, name) {
    return name in target ? target[name] : 0;
  },
};

const evalInstruction = (instruction, registers) => {
  eval(instruction);
  const currentMax = max(values(registers));
  if (currentMax > allTimeMax) { allTimeMax = currentMax; }
};

export const part1 = (input) => {
  const registers = new Proxy({}, handler);

  map(input, inst => evalInstruction(inst, registers));

  return max(values(registers));
};

export const part2 = (input) => {
  part1(input);

  return allTimeMax;
};
