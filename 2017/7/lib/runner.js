import { filter, chain, isEmpty } from "./utils";
import { some, find, includes, pickBy } from "lodash";

const hasChildren = (tower) => !(isEmpty(tower.children))

const notContainedInOtherChildren = (_value, key, collection) => {
  let found = some(collection, (value, _k) => {
    return includes(value.children, key);
  });

  return !found;
}

export const part1 = (input) => {
  return chain(input)
    .pickBy(hasChildren)
    .find(notContainedInOtherChildren)
    .value();
};

export const part2 = (input) => {
};
