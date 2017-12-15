const magicDivisor = 2147483647;

function* generator(factor, startingValue, iterations, check) {
  const savedFactor = factor;
  let value = startingValue;
  let iter = 0;

  while (iter < iterations) {
    const product = value * savedFactor;
    value = product % magicDivisor;
    if (value % check === 0) {
      yield value & 0xFFFF;
      iter += 1;
    }
  }
  return true;
}

export default generator;
