import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(65, 8921)).toEqual(588)
  });

  test("part 2 passes tests cases", () => {
    expect(part2(65, 8921)).toEqual(309)
  });
});
