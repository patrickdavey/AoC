import { raw } from "./lib/loader";
import { parse } from "./lib/parser";
import { part1, part2 } from "./lib/runner";

let parsed = parse(raw);

let treeRoot = part1(parsed).name;
console.log("tree root:", treeRoot)
console.log(part2(treeRoot, parsed));
