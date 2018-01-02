import { MatrixRotate, map, cloneDeep, zip, each, reduce, chain, intoLines } from "./utils";

const storeArrayIntoAcc = (acc, arr, output) => {
  let str = arr.map(l => l.join("")).join("/")
  acc[str] = output
}

const storeMirrorYIntoAcc = (acc, arr, output) => {
  let str = arr.reverse().map(l => l.join("")).join("/")
  acc[str] = output
}

const arrayColumn = (arr, n) => arr.map(x=> x[n])

const storeMirrorXIntoAcc = (acc, arr, output) => {
  let str = map(arr, v => v.reverse()).map(l => l.join("")).join("/")
  acc[str] = output
}

var rotateClockwise = function(matrix) {
  // reverse the rows
  matrix = matrix.reverse();
  // swap the symmetric elements
  for (var i = 0; i < matrix.length; i++) {
    for (var j = 0; j < i; j++) {
      var temp = matrix[i][j];
      matrix[i][j] = matrix[j][i];
      matrix[j][i] = temp;
    }
  }
  return matrix;
};

const storeRotations = (acc, arr, output) => {
  let str = cloneDeep(arr).map(l => l.join("")).join("/")
  acc[str] = output
  storeArrayIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorYIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorXIntoAcc(acc, cloneDeep(arr), output)

  rotateClockwise(arr)
  str = cloneDeep(arr).map(l => l.join("")).join("/")
  acc[str] = output
  storeArrayIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorYIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorXIntoAcc(acc, cloneDeep(arr), output)

  rotateClockwise(arr)
  str = cloneDeep(arr).map(l => l.join("")).join("/")
  acc[str] = output
  storeArrayIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorYIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorXIntoAcc(acc, cloneDeep(arr), output)

  rotateClockwise(arr)
  str = cloneDeep(arr).map(l => l.join("")).join("/")
  acc[str] = output
  storeArrayIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorYIntoAcc(acc, cloneDeep(arr), output)
  storeMirrorXIntoAcc(acc, cloneDeep(arr), output)
}

export const inputIntoArray = input => input.split("/").map(l => l.split(""))

const flipRotate = (acc, [input, output]) => {
  // for each input, we are going to store it as is into the acc.
  // Then we will flip it both horizonally and vertically and store those as rules.
  // then we will rotate it and perform the same tasks (store, flip)
  // first turn input into a 2d array
  let parsedOutput = inputIntoArray(output)
  let arrayInput = inputIntoArray(input)
  storeRotations(acc, cloneDeep(arrayInput), parsedOutput)
  return acc;
}

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(l => l.trim().split(" => "))
    .reduce(flipRotate, {})
    .value();
};
