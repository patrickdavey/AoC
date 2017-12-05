const { raw } = require("./lib/loader");
const { parse } = require("./lib/parser");
const { part1, part2 } = require("./lib/runner");

console.log(parse(raw));
console.log(part1(parse(raw)));
console.log(part2(parse(raw)));

