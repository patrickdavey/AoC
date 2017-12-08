import { parse } from "../lib/parser";

describe("Parser", () => {
  test("can partse sample data", () => {
    expect(parse(" a dec -511 if x >= -4 ")).toEqual(['if(registers["x"] >= -4) { registers["a"] -= -511}'])
  });
});
