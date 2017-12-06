import { max, indexOf } from "lodash";

const indexOfMaxInArray = (array) => {
  let maxValue = max(array);
  return indexOf(array, maxValue);
};

export const cycle = (array) => {
  let index = indexOfMaxInArray(array);
  let valueToDistribute = array[index];
  array[index] = 0;
  while(valueToDistribute > 0) {
    index = (index + 1) % array.length;
    array[index] += 1;
    valueToDistribute -= 1;
  }
  return array;
};
