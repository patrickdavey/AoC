import { spiralGenerator } from "../lib/spiral";

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    let spiral = spiralGenerator();

    expect(spiral.next().value.position).toEqual([0,0])
    expect(spiral.next().value.position).toEqual([1,0])
    expect(spiral.next().value.position).toEqual([1,1])
    expect(spiral.next().value.position).toEqual([0,1])
    expect(spiral.next().value.position).toEqual([-1,1])
    expect(spiral.next().value.position).toEqual([-1,0])
    expect(spiral.next().value.position).toEqual([-1,-1])
    expect(spiral.next().value.position).toEqual([0,-1])
    expect(spiral.next().value.position).toEqual([1,-1])
    expect(spiral.next().value.position).toEqual([2,-1])
  });
});
