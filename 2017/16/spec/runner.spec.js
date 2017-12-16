import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const INSTRUCTIONS = `s1,x3/4,pe/b`;

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse(INSTRUCTIONS), "abcde".split(""))).toEqual("baedc")
  });

  test("part 2 passes tests cases", () => {
    expect(part2(parse(INSTRUCTIONS), "abcde".split(""), 2)).toEqual("ceadb")
  });
});
