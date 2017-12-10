import { raw } from "./lib/loader";
import { parse } from "./lib/parser";
import { asciiSuffix } from "./lib/ascii_suffix";
import { part1, part2, part3 } from "./lib/runner";

console.log(part1([...Array(256).keys()], parse(raw)));

console.log(part2([...Array(256).keys()], asciiSuffix(raw)));

