import { isUndefined, clone, keys, each, split } from "lodash";

const gridDimensions = grid => {
  let minX = 1000000;
  let minY = 1000000;
  let maxX = -10000;
  let maxY = -10000;

  let gridKeys = keys(grid)
  each(gridKeys, (value) => {
    let [x, y] = split(value, ",").map(c => Number(c));
    if (x < minX) { minX = x}
    if (x > maxX) { maxX = x}
    if (y > maxY) { maxY = y}
    if (y < minY) { minY = y}
  })

  return [[minX, minY], [maxX, maxY]];

}
const findCentre = (grid) => {
  let [[minX, minY], [maxX, maxY]] = gridDimensions(grid);

  return [(maxX - minX) / 2, (maxY - minY) / 2];
}

const printGrid = (grid) => {
  let [[minX, minY], [maxX, maxY]] = gridDimensions(grid);
  let rows = []

  for(let x = minX; x <= maxX; x += 1) {
    let row = []
    for(let y = minY; y <= maxX; y += 1) {
      let c = grid[`${x},${y}`];

      if (isUndefined(c)) {
        row.push(".")
      } else {
        row.push(c)
      }
    }
    rows.push(row.join(""))
  }
  console.log(rows.join("\n"))
}

const DIRECTIONS = {
  UP: {
    vector: [0, -1],
    turnLeft: "LEFT",
    turnRight: "RIGHT",
    reverse: "DOWN",
  },
  DOWN: {
    vector: [0, 1],
    turnLeft: "RIGHT",
    turnRight: "LEFT",
    reverse: "UP",
  },
  LEFT: {
    vector: [-1, 0],
    turnLeft: "DOWN",
    turnRight: "UP",
    reverse: "RIGHT",
  },
  RIGHT: {
    vector: [1, 0],
    turnLeft: "UP",
    turnRight: "DOWN",
    reverse: "LEFT",
  },
};

const VIRUS_STATES = {
  "#": {
    next: "F"
  },
  F: {
    next: "."
  },
  W: {
    next: "#"
  },
  ".": {
    next: "W"
  },
}

const isInfected = (s) => s === "#";
const isClean = (s) => s === "." || isUndefined(s);
const isWeakened = (s) => s === "W";
const isFlagged = (s) => s === "F";

export const cleverVirusGenerator = function* cleverVirusGenerator(initialGrid) {
  let grid = clone(initialGrid);
  let [x, y] = findCentre(grid);
  let dir = DIRECTIONS["UP"];
  let infectionCount = 0;

  while(true) {
    let currentState = grid[`${x},${y}`] || "." ;

    if (isClean(currentState)) {
      dir = DIRECTIONS[dir.turnLeft];
    } else if (isInfected(currentState)) {
      dir = DIRECTIONS[dir.turnRight];
    } else if (isFlagged(currentState)) {
      dir = DIRECTIONS[dir.reverse];
    } else {
      infectionCount += 1;
    }

    grid[`${x},${y}`] = VIRUS_STATES[currentState].next;

    x += dir.vector[0];
    y += dir.vector[1];


    yield infectionCount;
  }
};
