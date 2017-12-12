import { uniq, isUndefined, flatten, keys, chain, difference } from "./utils";

function getGroup(map, children, alreadyVisited) {
  const nextChild = children.pop();
  if (isUndefined(nextChild)) { return uniq(alreadyVisited); }

  alreadyVisited.push(nextChild);

  const childrenToAdd = difference(map[nextChild], alreadyVisited);
  children.push(...(childrenToAdd));
  return getGroup(map, flatten(children), alreadyVisited);
}

export const part1 = input => getGroup(input, ["0"], []).length;

export const part2 = (input) => {
  let allIds = keys(input);
  let groupCount = 0;

  while (allIds.length > 0) {
    groupCount += 1;
    const nextId = allIds.pop();
    const nextGroup = getGroup(input, [nextId], []);
    allIds = difference(allIds, nextGroup);
  }

  return groupCount;
};
