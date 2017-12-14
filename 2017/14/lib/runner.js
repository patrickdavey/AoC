import { isUndefined, filter, chain } from "./utils";

export const part1 = (input) => {
  return chain(input)
    .map(l => filter(l, c => c === "1"))
    .map(l => l.length)
    .reduce((sum, value) => sum + value, 0)
    .value();
};

const mappedInput = (array) => {
  const val = {};
  for (let i = 0; i < 128; i += 1) {
    for (let j = 0; j < 128; j += 1) {
      val[`${i},${j}`] = array[i][j];
    }
  }
  return val;
};

function checkGroups(disk, i, j, groupNumber) {
  if (disk[`${i},${j}`] === "0") { return; }
  if (isUndefined(disk[`${i},${j}`])) { return; }

  if (disk[`${i},${j}`] === "1") {
    disk[`${i},${j}`]  = groupNumber;
    checkGroups(disk, i + 1, j, groupNumber);
    checkGroups(disk, i - 1, j, groupNumber);
    checkGroups(disk, i, j + 1, groupNumber);
    checkGroups(disk, i, j - 1, groupNumber);
  }
}

export const part2 = (input) => {
  let groupNumber = 0;
  const disk = mappedInput(input);

  for (let i = 0; i < 128; i += 1) {
    for (let j = 0; j < 128; j += 1) {
      if (disk[`${i},${j}`] === "1") {
        groupNumber += 1;
        checkGroups(disk, i, j, groupNumber);
      }
    }
  }

  return groupNumber;
};
