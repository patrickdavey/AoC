import { transpose, permutation, combination } from "../lib/utils";

describe("Utils", () => {
  test("transpose works", () => {
    expect(transpose([
      [1, 2, 3],
      [1, 2, 3],
      [1, 2, 3],
    ])).toEqual(
    [
      [1, 1, 1],
      [2, 2, 2],
      [3, 3, 3],
    ],
    );
  });

  test("transpose returns same if run twice", () => {
    expect(transpose(transpose([
      [1, 2, 3],
      [1, 2, 3],
      [1, 2, 3],
    ]))).toEqual(
    [
      [1, 2, 3],
      [1, 2, 3],
      [1, 2, 3],
    ],
    );
  });

  test("permutation gives us the correct size", () => {
    expect(permutation([1, 2, 3, 4]).toArray().length).toEqual(24);
  });

  test("permutation gives us the correct values", () => {
    expect(permutation([1, 2, 3]).toArray()).toEqual([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]);
  });

  test("combination gives us the correct size", () => {
    expect(combination([1, 2, 3], 2).length).toEqual(3);
  });
});
