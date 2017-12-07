import { raw } from "./lib/loader";
import { parse } from "./lib/parser";
import { part1, part2 } from "./lib/runner";

console.log(part1(parse(raw)).stepsTaken);
console.log(part2(parse(raw)).stepsTaken);

