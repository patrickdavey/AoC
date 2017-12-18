import {isUndefined} from "./utils"


const getNumberFor = (registers, arg) => (typeof arg === "number" ? arg : (registers[arg] || 0));

const INSTRUCTIONS = {
  set(a, b, registers, position) {
    registers[a] = getNumberFor(registers, b);
    return { position: position + 1, finish: false };
  },

  add(a, b, registers, position) {
    registers[a] += getNumberFor(registers, b);
    return { position: position + 1, finish: false };
  },

  mul(a, b, registers, position) {
    registers[a] = getNumberFor(registers, a) * getNumberFor(registers, b);
    return { position: position + 1, finish: false };
  },

  mod(a, b, registers, position) {
    registers[a] = getNumberFor(registers, a) % getNumberFor(registers, b);
    return { position: position + 1, finish: false };
  },

  snd(a, registers, position) {
    let lastPlayed = getNumberFor(registers, a);
    return { lastPlayed, position: position + 1, finish: false };
  },

  rcv(a, registers, position) {
    const finish = getNumberFor(registers, a) !== 0;
    return { position: position + 1, finish };
  },

  jgz(a, b, registers, position) {
    if (getNumberFor(registers, a) > 0) {
      return { position: position + getNumberFor(registers, b), finish: false };
    }
    return { position: position + 1, finish: false };
  }
};

export default class InstructionRunner {
  constructor(instructionSequence) {
    this.instructionSequence = instructionSequence;
    this.registers = {};
    this.lastPlayed = null;
    this.position = 0;
    this.finish = false;
  }

  performInstruction() {
    let instruction, args;
    ({ instruction, args } = this.instructionSequence[this.position]);

    let result = INSTRUCTIONS[instruction].call(null, ...args, this.registers, this.position);
    this.position = result.position;
    this.finish = result.finish;

    if (!isUndefined(result.lastPlayed)) {
      this.lastPlayed = result.lastPlayed;
    }

    return {
      lastPlayed: this.lastPlayed,
      finish: this.finish,
    }
  }
};
