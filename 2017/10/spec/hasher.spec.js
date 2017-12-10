import hashGenerator from "../lib/hasher";

describe("Hasher", () => {
  test("test data works", () => {
    let testHash = hashGenerator([0, 1, 2, 3, 4], [3, 4, 1, 5], 1);

    expect(testHash.next()).toEqual({ value: [2, 1, 0, 3, 4], done: false });
    expect(testHash.next()).toEqual({ value: [4, 3, 0, 1, 2], done: false });
    expect(testHash.next()).toEqual({ value: [4, 3, 0, 1, 2], done: false });
    expect(testHash.next()).toEqual({ value: [3, 4, 2, 1, 0], done: true });
  });

  test("part 2 passes tests cases", () => {
  });
});
