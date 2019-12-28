#!/bin/bash
set -e
cd /Users/patrickdavey/sites/advent_of_code/2019
# downloads instructions and input locally for a given day
# assumes your directory name is the number of adventday

if [[ $1 -eq 0 ]] ; then
  echo 'please supply the day (1-25, not zero based): (d)'
  exit 0
fi

DAY=$1
DIR="./${DAY}"
cp -a "/Users/patrickdavey/sites/advent_of_code/2019/common"* "${DIR}"
cd "${DIR}"
curl -b session=$(cat ${HOME}/.aocrc) https://adventofcode.com/2019/day/${DAY}/input > input.txt
curl -b session=$(cat ${HOME}/.aocrc) https://adventofcode.com/2019/day/${DAY} > instructions.html
pandoc -s -r html instructions.html -o temp.md
rm instructions.html
sed -n "/^--- Day $DAY/,\$p" temp.md > instructions.md
rm temp.md
