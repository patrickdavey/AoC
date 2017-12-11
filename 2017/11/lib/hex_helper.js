import { isEqual, values, reduce, chain, clone } from "lodash";

const INITIAL_VALUES = {
  ne: 0,
  n: 0,
  nw: 0,
  se: 0,
  sw: 0,
  s: 0,
};

const reduceBuckets = (acc, value) => {
  acc[value] += 1;
  return acc;
};

const removeOpposites = (walk, first, second) => {
  const difference = walk[first] - walk[second];

  if (walk[first] === 0 && walk[second] === 0) { return walk; }

  if (difference > 0) {
    walk[first] -= walk[second];
    walk[second] = 0;
  } else {
    walk[second] -= walk[first];
    walk[first] = 0;
  }

  return walk;
};

const reduceWalks = (walk, first, second, sub) => {
  if (walk[first] > 0 && walk[second] > 0) {
    if (walk[first] >= walk[second]) {
      walk[sub] += walk[second]
      walk[first] -= walk[second];
      walk[second] = 0;
    } else {
      walk[sub] += walk[first]
      walk[second] -= walk[first];
      walk[first] = 0;
    }
  }
  return walk;
};

export const intoBuckets = (input) => {
  return chain(input)
    .thru(arr => reduce(arr, reduceBuckets, clone(INITIAL_VALUES)))
    .value();
};

export const findShortest = (walkGroups) => {
  const newWalks = chain(clone(walkGroups))
    .thru(walks => removeOpposites(walks, "n", "s"))
    .thru(walks => removeOpposites(walks, "ne", "sw"))
    .thru(walks => removeOpposites(walks, "nw", "se"))
    .thru(walks => reduceWalks(walks, "ne", "s", "se"))
    .thru(walks => reduceWalks(walks, "nw", "s", "sw"))
    .thru(walks => reduceWalks(walks, "se", "sw", "s"))
    .thru(walks => reduceWalks(walks, "n", "se", "ne"))
    .thru(walks => reduceWalks(walks, "n", "sw", "nw"))
    .thru(walks => reduceWalks(walks, "nw", "ne", "n"))
    .value();

  if (isEqual(walkGroups, newWalks)) {
    return chain(newWalks)
      .thru(walks => values(walks))
      .thru(distances => distances.reduce((sum, v) => sum + v))
      .value();
  }

  return findShortest(newWalks);
};
