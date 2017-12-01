import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1("1122")).toEqual(3);
    expect(part1("1111")).toEqual(4);
    expect(part1("1234")).toEqual(0);
    expect(part1("91212129")).toEqual(9);
  });

  test("part 2 passes tests cases", () => {
    expect(part2("1212")).toEqual(6);
    expect(part2("1221")).toEqual(0);
    expect(part2("123425")).toEqual(4);
    expect(part2("123123")).toEqual(12);
    expect(part2("12131415")).toEqual(4);
  });
});
