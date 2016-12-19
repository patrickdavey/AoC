#!/bin/bash

YEAR=2016
DAY=${PWD##*/}
echo $DAY
curl -b session=$(cat ${HOME}/.aocrc) http://adventofcode.com/${YEAR}/day/${DAY}/input > input
