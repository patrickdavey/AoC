import { chain } from "./utils";
import InstructionRunner from "./instruction_runner";
import ComplexRunner from "./complex_runner";

export const part1 = (instructions) => {

  const instructionRunner = new InstructionRunner(instructions);
  let finish = false;
  let lastPlayed = null;
  let result = { finish: false }

  while (!(result.finish)) {
    result = instructionRunner.performInstruction();
  }

  return result.lastPlayed;
};

export const part2 = (instructions) => {
  const runner0 = new ComplexRunner(instructions, 0);
  const runner1 = new ComplexRunner(instructions, 1);
  runner0.setOther(runner1);
  runner1.setOther(runner0);

  while (runner1.getState() !== "terminated") {
  // for (let i = 0 ; i< 1000; i += 1) {
    // console.log(runner1.tick())
    // console.log(runner0.tick())
    runner0.tick();
    runner1.tick();
  }

  return runner1.getSendCount();
};
