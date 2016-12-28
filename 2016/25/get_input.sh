#!/bin/bash

# downloads instructions and input locally for a given day
# assumes your directory name is the number of adventday

YEAR=2016
DAY=${PWD##*/}
echo $DAY
curl -b session=$(cat ${HOME}/.aocrc) http://adventofcode.com/${YEAR}/day/${DAY}/input > input.txt
curl -b session=$(cat ${HOME}/.aocrc) http://adventofcode.com/${YEAR}/day/${DAY} > instructions.html
pandoc -s -r html instructions.html -o temp.md
rm instructions.html
sed -n "/^--- Day $DAY/,\$p" temp.md > instructions.md
rm temp.md
