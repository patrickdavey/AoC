export const spin = (array, numberToRotate) => {
  for (let i = 0; i < numberToRotate; i += 1) {
    array.unshift(array.pop());
  }
  return array;
};

export const exchange = (array, x, y) => {
  const tempX = array[x];
  array[x] = array[y];
  array[y] = tempX;
  return array;
};

export const partner = (array, a, b) => {
  const aIndex = array.indexOf(a)
  const bIndex = array.indexOf(b)
  array[aIndex] = b;
  array[bIndex] = a;
  return array;
}
