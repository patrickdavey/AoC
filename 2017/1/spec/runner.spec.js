import { part1 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1("1122")).toEqual(3);
    expect(part1("1111")).toEqual(4);
    expect(part1("1234")).toEqual(0);
    expect(part1("91212129")).toEqual(9);
  });
});
