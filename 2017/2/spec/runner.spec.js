import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    let input = `5 1 9 5
                 7 5 3
                 2 4 6 8`
    expect(part1(parse(input))).toEqual(18)
  });

  test("part 2 passes tests cases", () => {
    let input = `5 9 2 8
             9 4 7 3
             3 8 6 5`
    expect(part2(parse(input))).toEqual(9)
  });
});
