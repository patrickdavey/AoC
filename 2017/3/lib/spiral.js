import { filter, reduce, isUndefined } from "lodash";

const DIRECTION_VECTOR = { 
  right: [1, 0],
  up: [0, 1],
  left: [-1, 0],
  down: [0, -1]
}

const NEXT_DIRECTION = {
  right: "up",
  up: "left",
  left: "down",
  down: "right"
}

const DIRECTION_INCREMENT = {
  right: 1,
  up: 0,
  left: 1,
  down: 0
}

const isSquare = (number, squareSize) => (number * number == squareSize)

const spiralGenerator = function *() {
  let number = 1;
  let position = [0, 0];
  let direction = "right";
  let amount = 1;
  let size = 1;

  yield { number, position }

  while (true) {
    position[0] += DIRECTION_VECTOR[direction][0];
    position[1] += DIRECTION_VECTOR[direction][1];
    amount -= 1;
    number += 1;

    if (amount == 0) {
      direction = NEXT_DIRECTION[direction];
      size += DIRECTION_INCREMENT[direction];
      amount = size;
    }

    yield { number, position }
  }
}

const sumAround = (map, [x, y]) => {
  let neighbours = [
    map[`${x + 1},${y}`],
    map[`${x + 1},${y + 1}`],
    map[`${x + 1},${y - 1}`],
    map[`${x},${y + 1}`],
    map[`${x},${y - 1}`],
    map[`${x - 1},${y + 1}`],
    map[`${x - 1},${y}`],
    map[`${x - 1},${y - 1}`],
  ]

  return reduce(filter(neighbours, (n) => !isUndefined(n)), (sum, v) => sum + v);
}

const spiralSum = function *() {
  const generator = spiralGenerator();
  generator.next();
  const map = {
    "0,0": 1
  };

  while (true) {
    const position = generator.next().value.position;
    let sum = sumAround(map, position);
    map[ `${position[0]},${position[1]}` ] = sum;
    yield sum;
  }
}

export { spiralGenerator, spiralSum };
