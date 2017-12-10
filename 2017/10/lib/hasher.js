import { each } from "./utils";

function reverseSlice(array, length, offset) {
  const mapSlice = [];
  for (let i = length - 1; i > -1; i -= 1) {
    mapSlice.push(array[(offset + i) % array.length]);
  }

  each(mapSlice, (val, index) => array[(index + offset) % array.length] = val);
  return array;
}


export default function* hashGenerator(arr, lens, rnds = 1) {
  let array = arr;
  const lengths = lens;
  let inc = 0;
  let currentPosition = 0;
  let skipSize = 0;
  let rounds = rnds;


  while (rounds > 0) {
    const length = lengths[inc];
    array = reverseSlice(array, length, currentPosition);
    currentPosition = (currentPosition + length + skipSize) % array.length;
    skipSize += 1;
    inc += 1;

    if (inc === lengths.length) {
      rounds -= 1;
      inc = 0;
    }

    if (rounds > 0) {
      yield (array);
    }
  }

  return array;
}
