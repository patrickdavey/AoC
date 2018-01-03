import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const INPUT = ` 0/2
    2/2
    2/3
    3/4
    3/5
    0/1
    10/1
    9/10 `
describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    let parsed = parse(INPUT)
    expect(part1(parsed)).toEqual(31)
  });

  test("part 2 passes tests cases", () => {
  });
});
