import { parse } from "../lib/parser";

    // .#.   .#.   #..   ###
    // ..#   #..   #.#   ..#
    // ###   ###   ##.   .#.
//
const TEST_THREE_DATA = `   123/456/789 => 1   `
const TEST_FOUR = `   ####/..../####/.... => 1   `

describe("Parser", () => {
  test("parses rules into a rulebook", () => {
    let ruleBook = parse(TEST_THREE_DATA)
    console.log({ruleBook})
    expect(ruleBook["123/456/789"]).toEqual([["1"]])
    expect(ruleBook["789/456/123"]).toEqual([["1"]])
    expect(ruleBook["321/654/987"]).toEqual([["1"]])
    expect(ruleBook["741/852/963"]).toEqual([["1"]])
  });

  // test("parses 4 rules into a rulebook", () => {
  //   let ruleBook = parse(TEST_FOUR)
  //   console.log(ruleBook)
  // });
});
