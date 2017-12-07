import { keys, minBy, maxBy, groupBy, clone, values, map, some, includes } from "lodash";
import { chain, isEmpty } from "./utils";

const hasChildren = tower => !isEmpty(tower.children);
let towers = null;

const getNodeWeight = (name) => {
  const node = towers[name];
  return node.weight + node.children.reduce((a, b) => a + getNodeWeight(b), 0);
};

const findWeights = (root, desiredWeight) => {
  const childWeights = map(towers[root].children, (value) => {
    return { name: value, value: getNodeWeight(value)};
  });

  const groups = groupBy(childWeights, obj => obj.value);
  if (keys(groups).length === 1) {
    // then we have an unbalanced node where the children are all balanced
    // that is, we have found the bad one.
    let difference = desiredWeight - towers[root].weight - (childWeights.length * childWeights[0].value);
    return towers[root].weight + difference;
  }
  let unbalancedNode = (minBy(values(groups), (g) => g.length))[0];
  let siblingsWeight = (maxBy(values(groups), (g) => g.length))[0];
  return findWeights(unbalancedNode.name, siblingsWeight.value);
}

const notContainedInOtherChildren = (_value, key, collection) => !some(collection, (value) => includes(value.children, key))

/* this is awful. I find the parent that is not contained in other children. Awful. Step back and think,
 * If I had parsed the data and kept a list of parents then I could have walked up it. Much nicer.
 *
 * Ok, nicer still would have just been grabbing a list of the identifiers and uniquing them... heh not my solution,
 * but wow, super elegant */

export const part1 = (input) => {
  return chain(input)
    .pickBy(hasChildren)
    .find(notContainedInOtherChildren)
    .value();
};

export const part2 = (root, towersIn) => {
  towers = towersIn;
  return findWeights(root, 0);
};
