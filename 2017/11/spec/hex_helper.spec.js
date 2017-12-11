import { findShortest, intoBuckets } from "../lib/hex_helper";

describe("Hex Helper", () => {
  test("intoBuckets can build the base buckets", () => {
    expect(intoBuckets(["ne", "ne", "ne"])).toEqual({ ne: 3, n: 0, nw: 0, se: 0, sw: 0, s: 0 })
    expect(intoBuckets(["se", "sw", "se", "sw", "sw"])).toEqual({ ne: 0, n: 0, nw: 0, se: 2, sw: 3, s: 0 })
  });

  test("findShortest reduces into the minimum", () => {
    expect(findShortest({ ne: 3, n: 0, nw: 0, se: 0, sw: 0, s: 0 })).toEqual(3);
    expect(findShortest({ ne: 2, n: 0, nw: 0, se: 0, sw: 2, s: 0 })).toEqual(0);

    expect(findShortest({ ne: 2, n: 0, nw: 0, se: 0, sw: 0, s: 2 })).toEqual(2);
    expect(findShortest({ ne: 0, n: 0, nw: 2, se: 0, sw: 0, s: 2 })).toEqual(2);

    expect(findShortest({ ne: 0, n: 2, nw: 0, se: 2, sw: 0, s: 0 })).toEqual(2);
    expect(findShortest({ ne: 0, n: 2, nw: 0, se: 0, sw: 2, s: 0 })).toEqual(2);

    expect(findShortest({ ne: 0, n: 0, nw: 0, se: 2, sw: 3, s: 0 })).toEqual(3);
    expect(findShortest({ ne: 2, n: 0, nw: 3, se: 0, sw: 0, s: 0 })).toEqual(3);
  });
});
