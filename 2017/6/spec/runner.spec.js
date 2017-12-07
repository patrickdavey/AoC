import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1([0, 2, 7, 0]).stepsTaken).toEqual(5);
  });

  test("part 2 passes tests cases", () => {
    expect(part2([0, 2, 7, 0]).stepsTaken).toEqual(4);
  });
});
