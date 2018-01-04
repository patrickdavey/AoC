import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";
import { values, map, isUndefined } from "../lib/utils";

let currentPosition = 0;
let VALUES = {};
let currentState = "a";

const STATES = {
  a () {
    if (VALUES[currentPosition] === 0 || isUndefined(VALUES[currentPosition])) {
      VALUES[currentPosition] = 1;
      currentPosition += 1;
      currentState = "b"
    } else {
      VALUES[currentPosition] = 0;
      currentPosition += 1;
      currentState = "c"
    }
  },
  b () {
    if (VALUES[currentPosition] === 0 || isUndefined(VALUES[currentPosition])) {
      VALUES[currentPosition] = 0;
      currentPosition -= 1;
      currentState = "a"
    } else {
      VALUES[currentPosition] = 0;
      currentPosition += 1;
      currentState = "d"
    }
  },

  c () {
    if (VALUES[currentPosition] === 0 || isUndefined(VALUES[currentPosition])) {
      VALUES[currentPosition] = 1;
      currentPosition += 1;
      currentState = "d"
    } else {
      VALUES[currentPosition] = 1;
      currentPosition += 1;
      currentState = "a"
    }
  },

  d () {
    if (VALUES[currentPosition] === 0 || isUndefined(VALUES[currentPosition])) {
      VALUES[currentPosition] = 1;
      currentPosition -= 1;
      currentState = "e"
    } else {
      VALUES[currentPosition] = 0;
      currentPosition -= 1;
      currentState = "d"
    }
  },

  e () {
    if (VALUES[currentPosition] === 0 || isUndefined(VALUES[currentPosition])) {
      VALUES[currentPosition] = 1;
      currentPosition += 1;
      currentState = "f"
    } else {
      VALUES[currentPosition] = 1;
      currentPosition -= 1;
      currentState = "b"
    }
  },

  f () {
    if (VALUES[currentPosition] === 0 || isUndefined(VALUES[currentPosition])) {
      VALUES[currentPosition] = 1;
      currentPosition += 1;
      currentState = "a"
    } else {
      VALUES[currentPosition] = 1;
      currentPosition += 1;
      currentState = "e"
    }
  },
}

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    let steps = 0;
    while(steps < 12399302) {
      STATES[currentState]();
      steps += 1;
    }

    console.log(values(VALUES).map(v => Number(v)).reduce((acc, v) => acc + v, 0))
  });

  test("part 2 passes tests cases", () => {
  });
});
