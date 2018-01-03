import {isUndefined} from "./utils"


let mulCount = 0;

const getNumberFor = (registers, arg) => (typeof arg === "number" ? arg : (registers[arg] || 0));

const INSTRUCTIONS = {
  set(a, b, registers, position) {
    registers[a] = getNumberFor(registers, b);
    return { position: position + 1}
  },

  mul(a, b, registers, position) {
    mulCount += 1;
    registers[a] = getNumberFor(registers, a) * getNumberFor(registers, b);
    return { position: position + 1}
  },

  sub(a, b, registers, position) {
    registers[a] = getNumberFor(registers, a) - getNumberFor(registers, b);
    return { position: position + 1}
  },

  jnz(a, b, registers, position) {
    if (getNumberFor(registers, a) != 0) {
      return { position: position + getNumberFor(registers, b)}
    }
    return { position: position + 1}
  }
};

export default class InstructionRunner {
  constructor(instructionSequence) {
    this.instructionSequence = instructionSequence;
    this.registers = { a: 1 };
    this.position = 0;
  }

  run () {
    let instruction, args;
    let i = 0;

    while (i < 10000) {
      ({ instruction, args } = this.instructionSequence[this.position]);
      let result = INSTRUCTIONS[instruction].call(null, ...args, this.registers, this.position);
      this.position = result.position;
      console.log({pos: this.position, reg: this.registers })

      if (this.position < 0 || this.position >= this.instructionSequence.length) {
        return mulCount;
      }

      i += 1;
    }
  }
};
