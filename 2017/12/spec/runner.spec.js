import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const SAMPLE = ` 0 <-> 2
    1 <-> 1
    2 <-> 0, 3, 4
    3 <-> 2, 4
    4 <-> 2, 3, 6
    5 <-> 6
    6 <-> 4, 5`

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse(SAMPLE))).toEqual(6)
  });

  test("part 2 passes tests cases", () => {
    expect(part2(parse(SAMPLE))).toEqual(2)
  });
});
