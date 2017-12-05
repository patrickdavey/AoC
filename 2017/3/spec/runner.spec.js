import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(23)).toEqual(2)
    expect(part1(1024)).toEqual(31)
  });

  test("part 2 passes tests cases", () => {
    expect(part2(13)).toEqual(23)
    expect(part2(59)).toEqual(122)
  });
});
