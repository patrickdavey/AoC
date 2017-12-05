import { spiralGenerator, spiralSum } from "./spiral";

export const part1 = (input) => {
  let spiral = spiralGenerator();
  let pos = spiral.next();
  while(pos.value.number != input) {
    pos = spiral.next();
  }
  let coords = pos.value.position;
  return Math.abs(coords[0]) + Math.abs(coords[1]);
}

export const part2 = (input) => {
  let spiral = spiralSum();
  let pos = spiral.next();
  while(pos.value <= input) {
    pos = spiral.next();
  }
  return pos.value;
}
