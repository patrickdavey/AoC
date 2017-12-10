import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1([0, 1, 2, 3, 4], [3, 4, 1, 5])).toEqual(12);
  });

  test("part 2 passes tests cases", () => {
  });
});
