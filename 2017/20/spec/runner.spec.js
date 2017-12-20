import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const TEST_DATA = ` p=<3,0,0>, v=<2,0,0>, a=<-1,0,0>
    p=<4,0,0>, v=<0,0,0>, a=<-2,0,0>`;

const COLLISION_DATA = ` p=<-6,0,0>, v=<3,0,0>, a=<0,0,0>
p=<-4,0,0>, v=<2,0,0>, a=<0,0,0>
p=<-2,0,0>, v=<1,0,0>, a=<0,0,0>
p=<3,0,0>, v=<-1,0,0>, a=<0,0,0>`;

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse(TEST_DATA))).toEqual(0)
  });

  test("part 2 passes tests cases", () => {
    expect(part2(parse(COLLISION_DATA))).toEqual(1)
  });
});
