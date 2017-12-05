const tco = require("tco");

const addOne = (value) => value + 1;
const conditionalAdd = (value) => value >= 3 ? value -1 : value + 1;
const withinArrayBounds = (index, array) => index >= 0 && index < array.length;

const process = tco((input, currentPosition, stepCount, adjustment) => {
  stepCount++;
  let nextPosition = input[currentPosition] + currentPosition;
  input[currentPosition] = adjustment(input[currentPosition]);
  currentPosition = nextPosition;

  if (withinArrayBounds(currentPosition, input)) {
    return [process, [input, currentPosition, stepCount, adjustment]];
  }
  return [null, stepCount];
});

module.exports = {
  part1: (input) => process(input, 0, 0, addOne),
  part2: (input) => process(input, 0, 0, conditionalAdd)
};
