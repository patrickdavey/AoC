import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(3, 2017)).toEqual(638);
  });
});
