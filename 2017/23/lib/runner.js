import { chain } from "./utils";
import InstructionRunner from "./instruction_runner";

export const part1 = (instructions) => {
  const instructionRunner = new InstructionRunner(instructions);

  return instructionRunner.run();
};

export const part2 = (instructions) => {
};
