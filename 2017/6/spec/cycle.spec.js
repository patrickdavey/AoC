import { cycle } from "../lib/cycle";

describe("Cycle", () => {
  test("test inputs work correctly", () => {
    expect(cycle([0, 2, 7, 0])).toEqual([2, 4, 1, 2]);
    expect(cycle([2, 4, 1, 2])).toEqual([3, 1, 2, 3]);
    expect(cycle([3, 1, 2, 3])).toEqual([0, 2, 3, 4]);
  });
});
