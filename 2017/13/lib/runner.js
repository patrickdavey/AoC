import { isUndefined, cloneDeep, forEach, mapValues } from "lodash";
import { max, keys, chain, intoLines, reduce } from "./utils";

const updateAllScanners = (scanners) => {
  forEach(scanners, (value, key) => {
    const offset = value.direction == "forward" ? 1 : -1;
    value.position = (value.position + offset);
    if (value.position == 0) {
      value.direction = "forward";
    } else if (value.position === value.depth - 1) {
      value.direction = "backwards";
    }
    scanners[key] = value;
  });
  return scanners;
};

const calculateSeverity = (scanners, shortCircuit, pico) => {
  let maxScanner = max(keys(scanners).map((k) => Number(k)));
  let severity = 0;
  for(let i = 0; i < maxScanner + 1; i+= 1) {
    if(!(isUndefined(scanners[i])) && scanners[i].position == 0) {
      severity += scanners[i].depth * i;
    }
    updateAllScanners(scanners);
  }
  return severity;
};

const noCatch = (scanners, maxScanner) => {
  for(let i = 0; i < maxScanner + 1; i+= 1) {
    if(!(isUndefined(scanners[i])) && scanners[i].position == 0) {
      return false
    }
    updateAllScanners(scanners);
  }
  return true;
};

export const part1 = (scanners) => {
  return chain(scanners)
    .thru(scanners => calculateSeverity(scanners), false, 0)
    .value();
};

export const part2 = (input) => {
  let scanners = cloneDeep(input);
  let picoSecond = 0;
  let maxScanner = max(keys(scanners).map((k) => Number(k)));

  while(true) {
    if(noCatch(cloneDeep(scanners), maxScanner)) {
      return picoSecond;
    }

    updateAllScanners(scanners);
    picoSecond += 1
  }
};
