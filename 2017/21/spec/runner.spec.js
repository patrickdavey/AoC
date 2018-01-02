import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const RULES = `../.# => ##./#../...
    .#./..#/### => #..#/..../..../#..# `

describe("Runner", () => {
  test.only("part 1 passes tests cases", () => {
    expect(part1(parse(RULES), 2)).toEqual(12)
  });

  test("part 2 passes tests cases", () => {
  });
});
