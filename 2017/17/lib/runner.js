import spinlock from "./spinlock";
import { indexOf } from "./utils";

export const part1 = (input, valueAfter) => {
  let spin = spinlock(input);
  let nextValue = spin.next().value

  while (nextValue.i < valueAfter + 1) {
    nextValue = spin.next().value;
    if (nextValue.i == valueAfter) {
      let index = indexOf(nextValue.memory, valueAfter) + 1;
      return (nextValue.memory[index]);
    }
  }
};

export const part2 = (stepIncrement) => {
  let position = 0;
  for (let i = 1; i < 50000000 + 1; i++) {
    position = (position + stepIncrement) % i + 1
    if (position == 1) {
      console.log(i);
    }
  }
};
