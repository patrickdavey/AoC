#!/bin/bash
set -e

# downloads instructions and input locally for a given day
# assumes your directory name is the number of adventday

if [[ $1 -eq 0 ]] ; then
  echo 'please supply the day (1-25, not zero based): (d)'
  exit 0
fi

DAY=$1
DIR="./${DAY}/"
cp -a "common" "${DIR}"
cd "${DIR}"
curl -b session=$(cat ${HOME}/.aocrc) http://adventofcode.com/2017/day/${DAY}/input > input.txt
curl -b session=$(cat ${HOME}/.aocrc) http://adventofcode.com/2017/day/${DAY} > instructions.html
pandoc -s -r html instructions.html -o temp.md
rm instructions.html
sed -n "/^--- Day $DAY/,\$p" temp.md > instructions.md
rm temp.md
