import {isUndefined} from "./utils"


const getNumberFor = (registers, arg) => (typeof arg === "number" ? arg : (registers[arg] || 0));

const INSTRUCTIONS = {
  set(a, b, registers, position) {
    registers[a] = getNumberFor(registers, b);
    return { position: position + 1, state: "ok" }
  },

  add(a, b, registers, position) {
    registers[a] += getNumberFor(registers, b);
    return { position: position + 1, state: "ok" }
  },

  mul(a, b, registers, position) {
    registers[a] = getNumberFor(registers, a) * getNumberFor(registers, b);
    return { position: position + 1, state: "ok" }
  },

  mod(a, b, registers, position) {
    registers[a] = getNumberFor(registers, a) % getNumberFor(registers, b);
    return { position: position + 1, state: "ok" }
  },

  snd(a, registers, position, _queue, otherProcess) {
    otherProcess.receive(getNumberFor(registers, a));
    return { position: position + 1, state: "ok", didSend: true }
  },

  rcv(a, registers, position, queue) {
    if (queue.length == 0) {
      return { position, state: "waiting" }
    }

    registers[a] = queue.shift();
    return { position: position + 1, state: "ok" }
  },

  jgz(a, b, registers, position) {
    if (getNumberFor(registers, a) > 0) {
      return { position: position + getNumberFor(registers, b), state: "ok" };
    }
    return { position: position + 1, state: "ok" }
  }
};

export default class InstructionRunner {
  constructor(instructionSequence, programId) {
    this.instructionSequence = instructionSequence;
    this.registers = { p: programId };
    this.queue = [];
    this.sendCount = 0;
    this.position = 0;
    this.state = "ok";
    this.tickVal = 0;
  }

  setOther(otherProcess) {
    this.otherProcess = otherProcess;
  }

  receive(value) {
    this.queue.push(value)
  }

  getState() {
    return this.state;
  }

  getSendCount() {
    return this.sendCount;
  }

  terminate() {
    this.state = "terminated";
  }

  queueLength() {
    return this.queue.length;
  }

  checkState(instructionState) {
    if (instructionState === "ok") {
      return (this.position >= 0 && this.position < this.instructionSequence.length ? "ok" : "terminated");
    }

    if (this.otherProcess.getState() == "waiting" || this.otherProcess.getState() == "terminated") {
      this.terminate();
      this.otherProcess.terminate()
      return "terminated";
    } else {
      return "waiting"
    }

  }

  tick() {
    this.tickVal += 1;
    if (this.state == "terminated") { // || this.tickVal > 1382) {
      return false;
    }

    let instruction, args;
    ({ instruction, args } = this.instructionSequence[this.position]);

    let result = INSTRUCTIONS[instruction].call(null, ...args, this.registers, this.position, this.queue, this.otherProcess)
    this.position = result.position;

    this.state = this.checkState(result.state);

    if (result.didSend) {
      this.sendCount += 1;
    }
  }
};
