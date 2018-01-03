import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const TEST_MAP = ` ..#
    #..
    ...`;

describe("Runner", () => {
  test("part 1 passes 70 count", () => {
    let grid = parse(TEST_MAP);
    expect(part1(grid, 70)).toEqual(41)
  });

  test("part 1 passes 10000 count", () => {
    let grid = parse(TEST_MAP);
    expect(part1(grid, 10000)).toEqual(5587)
  });

  test("part 2 passes tests cases", () => {
  });
});
