import { parse } from "../lib/parser";
import { part1, part2 } from "../lib/runner";
const MAZE = `         |          
         |  +--+    
         A  |  C    
     F---|----E|--+ 
         |  |  |  D 
         +B-+  +--+`;
describe("Runner", () => {
  test("part 1 passes tests cases", () => {
    expect(part1(parse(MAZE)).letters).toEqual("ABCDEF")
  });

  test("part 2 passes tests cases", () => {
    expect(part1(parse(MAZE)).steps).toEqual(38)
  });
});
