import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const sample = `b inc 5 if a > 1
    a inc 1 if b < 5
    c dec -10 if a >= 1
    c inc -20 if c == 10`

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse(sample))).toEqual(1)
  });

  test("part 2 passes tests cases", () => {
    expect(part2(parse(sample))).toEqual(10)
  });
});
