import { trim } from "./utils";
const fs = require("fs");
const path = require("path");

const pathToInput = path.resolve(__dirname, "../input.txt");
const rawInput = fs.readFileSync(pathToInput, "utf8");

export const raw = trim(rawInput);
