import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const TEST_INPUT = `0: 3
    1: 2
    4: 4
    6: 4`;

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse(TEST_INPUT))).toEqual(24);
  });

  test("part 2 passes tests cases", () => {
    expect(part2(parse(TEST_INPUT))).toEqual(10);
  });
});
