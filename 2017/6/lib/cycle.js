import { max, indexOf, clone} from "lodash";

const indexOfMaxInArray = (array) => {
  let maxValue = max(array);
  return indexOf(array, maxValue);
};

export const cycleGenerator = function* cycleGenerator(array) {
  let localArray = clone(array);

  while(true) {
    let index = indexOfMaxInArray(localArray);
    let valueToDistribute = localArray[index];
    localArray[index] = 0;

    while(valueToDistribute > 0) {
      index = (index + 1) % localArray.length;
      localArray[index] += 1;
      valueToDistribute -= 1;
    }

    yield localArray;
  }
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
