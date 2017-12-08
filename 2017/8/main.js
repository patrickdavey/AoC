import { raw } from "./lib/loader";
import { parse } from "./lib/parser";
import { part1, part2 } from "./lib/runner";

let parsed = parse(raw);
console.log("max number left in registers: ", part1(parsed));
console.log("max number all time: ", part2(parsed));

