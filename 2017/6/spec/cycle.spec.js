import { cycle, cycleGenerator } from "../lib/cycle";

describe("Cycle", () => {
  test("test inputs work correctly", () => {
    expect(cycle([0, 2, 7, 0])).toEqual([2, 4, 1, 2]);
    expect(cycle([2, 4, 1, 2])).toEqual([3, 1, 2, 3]);
    expect(cycle([3, 1, 2, 3])).toEqual([0, 2, 3, 4]);
  });

  test("test cycleGenerator work correctly", () => {
    let gen = cycleGenerator([0, 2, 7, 0]);

    expect(gen.next().value).toEqual([2, 4, 1, 2]);
    expect(gen.next().value).toEqual([3, 1, 2, 3]);
    expect(gen.next().value).toEqual([0, 2, 3, 4]);

    let nextgen = cycleGenerator([0, 2, 7, 0]);

    expect(nextgen.next().value).toEqual([2, 4, 1, 2]);
    expect(nextgen.next().value).toEqual([3, 1, 2, 3]);
    expect(nextgen.next().value).toEqual([0, 2, 3, 4]);
  });
});
