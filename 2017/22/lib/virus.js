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
  },
  DOWN: {
    vector: [0, 1],
    turnLeft: "RIGHT",
    turnRight: "LEFT",
  },
  LEFT: {
    vector: [-1, 0],
    turnLeft: "DOWN",
    turnRight: "UP",
  },
  RIGHT: {
    vector: [1, 0],
    turnLeft: "UP",
    turnRight: "DOWN",
  },
};

const currentNodeIsInfected = (grid, x, y) => grid[`${x},${y}`] === "#";

export const virusGenerator = function* virusGenerator(initialGrid) {
  let grid = clone(initialGrid);
  let [x, y] = findCentre(grid);
  let dir = DIRECTIONS["UP"];
  let infectionCount = 0;

  while(true) {
    if (!currentNodeIsInfected(grid, x, y)) {
      dir = DIRECTIONS[dir.turnLeft];
      grid[`${x},${y}`] = "#";
      infectionCount += 1;
    } else {
      dir = DIRECTIONS[dir.turnRight];
      grid[`${x},${y}`] = ".";
    }

    x += dir.vector[0];
    y += dir.vector[1];

    yield infectionCount;
  }
};
