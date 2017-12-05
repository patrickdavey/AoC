import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    let answer = part1([0, 3, 0, 1, -3]);
    expect(answer).toEqual(5);
  });

  test("part 2 passes tests cases", () => {
    let answer = part2([0, 3, 0, 1, -3]);
    expect(answer).toEqual(10);
  });
});
