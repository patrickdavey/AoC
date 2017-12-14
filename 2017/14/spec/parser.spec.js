import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";
import { slice } from "../lib/utils";

describe("Parser", () => {
  test("test data works correctly", () => {
    expect(slice(parse("flqrgnkx")[0], 0, 8)).toEqual(["1", "1", "0", "1", "0", "1", "0", "0"])
  });
});
