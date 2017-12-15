const toBinary = number => `00000000000000000000000000000000000${number.toString(2)}`.slice(-16);
const magicDivisor = 2147483647;

const remainder = (number, divisor) => {
  return number % divisor;
}

function* generator(factor, startingValue, iterations, check) {
  const savedFactor = factor;
  let value = startingValue;
  let iter = 0;

  while (iter < iterations) {
    let product = value * savedFactor;
    value = remainder(product, magicDivisor);
    if (value % check == 0) {
      yield toBinary(value);
      iter += 1;
    }
  }
  return true;
}

export default generator;


//   const lengths = lens;
//   let inc = 0;
//   let currentPosition = 0;
//   let skipSize = 0;
//   let rounds = rnds;


//   while (rounds > 0) {
//     const length = lengths[inc];
//     array = reverseSlice(array, length, currentPosition);
//     currentPosition = (currentPosition + length + skipSize) % array.length;
//     skipSize += 1;
//     inc += 1;

//     if (inc === lengths.length) {
//       rounds -= 1;
//       inc = 0;
//     }

//     if (rounds > 0) {
//       yield (array);
//     }
//   }

//   return array;
// }
