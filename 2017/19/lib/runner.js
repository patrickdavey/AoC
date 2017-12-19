import { isUndefined, chain } from "./utils";

const isLetter = l => /[A-Za-z]/.test(l)

let letters = [];
let travel = "up";
let x = null;
let y = null;
let map = null;
let steps = 0;

const VECTORS = {
  up: [0, 1],
  right: [1, 0],
  down: [0, -1],
  left: [-1, 0],
};

const updatePositions = () => {
  x += VECTORS[travel][0];
  y += VECTORS[travel][1];
  steps += 1;
};


const performHorizontalTravel = () => {
  updatePositions();
}

const performVerticalTravel = () => {
  updatePositions();
}

const performAtCrossroads = () => {
  // now we are standing on a crossroads. We need to _change_ from the axis
  // we are currently travelling on.
  let possible = null;
  switch (travel) {
    case "up":
    case "down":
      // must turn left or right
      possible = map[`${x + 1},${y}`];
      if (!isUndefined(possible) && possible !== " ") {
        // stay where we are, but start moving right
        travel = "right";
      } else {
        travel = "left";
      }
      break;

    case "left":
    case "right":
      possible = map[`${x},${y + 1}`];
      if (!isUndefined(possible) && possible !== " ") {
        // stay where we are, but start moving right
        travel = "up";
      } else {
        travel = "down";
      }
      break;
    default:
      throw new Error("invalid travel");
  }
  updatePositions();
};

export const part1 = (mapIn) => {
  map = mapIn;
  [x, y] = map.start;

  while (true) {
    const currentChar = map[`${x},${y}`];
    switch (currentChar) {
      case "-":
        performHorizontalTravel();
        break;
      case "|":
        performVerticalTravel();
        break;
      case "+":
        performAtCrossroads();
        break;
      default:
        const testIsLetter = isLetter(currentChar);
        if (!testIsLetter) {
          return {
            letters: letters.join(""),
            steps: steps
          }
        }
        letters.push(currentChar);
        updatePositions();
    }
  }
};
