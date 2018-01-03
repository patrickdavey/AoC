import { raw } from "./lib/loader";
import { parse } from "./lib/parser";
import { part1, part2 } from "./lib/runner";

let parsed = parse(raw);
console.log(part1(parsed, 10000));
// console.log(part2(parsed));

