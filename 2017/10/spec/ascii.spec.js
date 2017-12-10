import { asciiSuffix } from "../lib/ascii_suffix";

describe("ascii", () => {
  test("test data works", () => {
    expect(asciiSuffix("1,2,3")).toEqual([49, 44, 50, 44, 51, 17, 31, 73, 47, 23])
  });
});
