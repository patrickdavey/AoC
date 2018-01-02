import { raw } from "./lib/loader";
import { parse } from "./lib/parser";
import { part1, part2 } from "./lib/runner";

let rules = parse(raw);
console.log(part1(rules, 5));
console.log(part1(rules, 18));
//console.log(part2(parsed));

