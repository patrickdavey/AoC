import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const SIMPLE_INSTRUCTIONS = ` set a 1
    add a 2
    mul a a
    mod a 5
    snd a
    set a 0
    rcv a
    jgz a -1
    set a 1
    jgz a -2 `;

const COMPLEX_INSTRUCTIONS = `snd 1
snd 2
snd p
rcv a
rcv b
rcv c
rcv d`;

describe("Runner", () => {
  // test("part 1 passes tests cases", () => {
  //   expect(part1(parse(INSTRUCTIONS))).toEqual(4)
  // });

  test("part 2 passes tests cases", () => {
    expect(part2(parse(COMPLEX_INSTRUCTIONS))).toEqual(3)
  });
});
