import { partner, spin, exchange } from "../lib/dance_moves";

describe("Dance Moves", () => {
  test("spin works correctly", () => {
    expect(spin(["a", "b", "c", "d", "e"], 3)).toEqual(["c", "d", "e", "a", "b"])
  });

  test("exchange works correctly", () => {
    expect(exchange(["e", "a", "b", "c", "d"], 3, 4)).toEqual(["e", "a", "b", "d", "c"])
  });

  test("partner works correctly", () => {
    expect(partner(["e", "a", "b", "d", "c"], "e", "b")).toEqual(["b", "a", "e", "d", "c"])
  });
});
