import { part1, part2 } from "../lib/runner";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1("{}")).toEqual(1);
    expect(part1("{{{}}}")).toEqual(6);
    expect(part1("{{},{}}")).toEqual(5);
    expect(part1("{{{},{},{{}}}}")).toEqual(16);
    expect(part1("{<a>,<a>,<a>,<a>}")).toEqual(1);
    expect(part1("{{<ab>},{<ab>},{<ab>},{<ab>}}")).toEqual(9);
  });

  test("part 2 passes tests cases", () => {
    expect(part2("<>")).toEqual(0);
    expect(part2("<random characters>")).toEqual(17);
    expect(part2("<<<<>")).toEqual(3);
    expect(part2("<{!>}>")).toEqual(2);
    expect(part2("<!!>")).toEqual(0);
    expect(part2("<!!!>>")).toEqual(0);
    expect(part2('<{o"i!a,<{i<a>')).toEqual(10);
  });
});
