import { each, reduce, chain, size, isUndefined } from "./utils";
import { inputIntoArray } from "./parser";

const INITIAL_BOARD = ".#./..#/###";
let grid = null;

const gridSize = () => Math.sqrt(size(grid))

const applyRule = (tempGrid, match, rowOffset, colOffset) => {
  let multiplier = size(match);
  each(match, (row, rowIndex) => {
    each(row, (c, colIndex ) => {
      tempGrid[`${(rowOffset * multiplier) + rowIndex},${colIndex + (colOffset * multiplier)}`] = c
    })
  });
}

const printGrid = () => {
  let rows = [];
  let currentGridSize = gridSize();
  for (let i = 0; i < currentGridSize; i += 1) {
    let row = [];
    for (let j = 0; j < currentGridSize; j += 1) {
      row.push(grid[`${i},${j}`])
    }
    rows.push(row.join(""))
  }
  console.log(rows.join("\n"))
  console.log("\n\n\n")
}

const countGrid = () => {
  let count = 0;
  let currentGridSize = gridSize();
  for (let i = 0; i < currentGridSize; i += 1) {
    for (let j = 0; j < currentGridSize; j += 1) {
      if (grid[`${i},${j}`] == "#"){
        count += 1;
      }
    }
  }
  return count;
}

export const part1 = (rules, iterations) => {
  let currentIteration = 0;
  grid = inputIntoArray(INITIAL_BOARD)
  grid = reduce(grid, (acc, row, rowIndex) => {
    each(row, (v, col) => acc[`${rowIndex},${col}`] = v)
    return acc;
  }, {});

  while (currentIteration < iterations) {
    let newGrid = {};
    let currentGridSize = gridSize();
    console.log("Current grid size", currentGridSize)
    if (gridSize() % 2 == 0) {
      for (let i = 0; i < currentGridSize; i += 2) {
        for (let j = 0; j < currentGridSize; j += 2) {
          let twoStr = `${grid[`${i},${j}`]}${grid[`${i},${j + 1}`]}/${grid[`${i + 1},${j}`]}${grid[`${i + 1},${j + 1}`]}`
          let matchingRule = rules[twoStr];
          if (isUndefined(matchingRule)) {
            console.log({
              twoStr, rules
            })
            throw "no matching rule two"
          } else {
            applyRule(newGrid, matchingRule, i/2, j/2)
          }
        }
      }
    } else if (gridSize() % 3 == 0) {
      for (let i = 0; i < currentGridSize; i += 3) {
        for (let j = 0; j < currentGridSize; j += 3) {
          let threeStr = `${grid[`${i},${j}`]}${grid[`${i},${j + 1}`]}${grid[`${i},${j + 2}`]}/${grid[`${i + 1},${j}`]}${grid[`${i + 1},${j + 1}`]}${grid[`${i + 1},${j + 2}`]}/${grid[`${i + 2},${j}`]}${grid[`${i + 2},${j + 1}`]}${grid[`${i + 2},${j + 2}`]}`
          let matchingRule = rules[threeStr];
          if (isUndefined(matchingRule)) {
            console.log({
              threeStr, rules
            })
            throw "no matching rule three"
          } else {

            applyRule(newGrid, matchingRule, i/3, j/3)
          }
        }
      }
    } else {
      throw "sdfdsf"
    }

    grid = newGrid;

    currentIteration += 1;

  }

  return countGrid();
};

export const part2 = (input) => {
};
