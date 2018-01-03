import { parse } from "../lib/parser";

describe("Parse", () => {
  test("can parse input", () => {
    expect(parse("set i 31")[0]).toEqual({ instruction: "set", args: ["i", 31] });
    expect(parse("set i -31")[0]).toEqual({ instruction: "set", args: ["i", -31] });
    expect(parse("set i j")[0]).toEqual({ instruction: "set", args: ["i", "j"] });
    expect(parse("mul i j")[0]).toEqual({ instruction: "mul", args: ["i", "j"] });
    expect(parse("mul i -3")[0]).toEqual({ instruction: "mul", args: ["i", -3] });
    expect(parse("add i -3")[0]).toEqual({ instruction: "add", args: ["i", -3] });
    expect(parse("add i j")[0]).toEqual({ instruction: "add", args: ["i", "j"] });
    expect(parse("mod i -3")[0]).toEqual({ instruction: "mod", args: ["i", -3] });
    expect(parse("mod i j")[0]).toEqual({ instruction: "mod", args: ["i", "j"] });
    expect(parse("jgz i j")[0]).toEqual({ instruction: "jgz", args: ["i", "j"] });
    expect(parse("jgz i -3")[0]).toEqual({ instruction: "jgz", args: ["i", -3] });
    expect(parse("rcv a")[0]).toEqual({ instruction: "rcv", args: ["a"] });
    expect(parse("snd a")[0]).toEqual({ instruction: "snd", args: ["a"] });
  });

  test("part 2 passes tests cases", () => {
  });
});
