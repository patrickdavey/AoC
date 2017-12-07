import { parse } from "../lib/parser";

describe("Parser", () => {
  test("can parse test data", () => {
    let data = parse(` pbga (66)
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

    expect(data["xhth"].weight).toEqual(57);
    expect(data["ugml"].weight).toEqual(68);
    expect(data["ugml"].children).toEqual(['gyxo', 'ebii', 'jptl']);
  });
});
