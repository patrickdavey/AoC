import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse("flqrgnkx"))).toEqual(8108)
  });

  test("part 2 passes tests cases", () => {
    expect(part2(parse("flqrgnkx"))).toEqual(1242)
  });
});
