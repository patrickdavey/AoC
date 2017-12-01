const fs = require("fs");
const path = require("path");

const pathToInput = path.resolve(__dirname, "../input.txt");

export const input = fs.readFileSync(pathToInput, "utf8").trim();
