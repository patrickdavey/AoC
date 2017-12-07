import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";

const data = parse(` pbga (66)
                   xhth (57)
                   ebii (61)
                   havc (66)
                   ktlj (57)
                   fwft (72) -> ktlj, cntj, xhth
                   qoyq (66)
                   padx (45) -> pbga, havc, qoyq
                   tknk (41) -> ugml, padx, fwft
                   jptl (61)
                   ugml (68) -> gyxo, ebii, jptl
                   gyxo (61)
                   cntj (57)`);

describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(data).name).toEqual("tknk");
  });

  test("part 2 passes tests cases", () => {
    expect(part2("tknk", data)).toEqual(60);
  });
});
