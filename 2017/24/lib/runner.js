import { max, reduce, flatten, each, filter, chain, reject, difference, map, cloneDeep, includes, flattenDepth } from "./utils";
const tco = require("tco");

let possibleBridges = null;
let allBridges = null;

const availablePortsWithConnections = (ports, pin) => {
  return filter(ports, ([x, y]) => x == pin || y == pin);
}

const structureize = ([a, b]) => {
  return {
    nextConnection: (a == "0" ? b : a),
    links: [[a, b]]
  }
}

const addSpanToBridge = ([a, b], bridge) => {
  bridge.links.push([a, b])
  bridge.nextConnection = (bridge.nextConnection == a ? b : a)
  return bridge;
}

const findBestBridge = tco((bridges, finishedBridges) => {
  if (bridges.length == 0) {
    return [null, finishedBridges];
  }

  let bridge = bridges.pop();
  let linkStrings = map(bridge.links, e => e.join("/"))
  let availablePorts = reject(allBridges, (e) => includes(linkStrings, e.join("/")))
  let suitableSpans = availablePortsWithConnections(availablePorts, bridge.nextConnection)

  if (suitableSpans.length == 0) {
    // we have finished a bridge
    finishedBridges.push(bridge)
    return [findBestBridge, [bridges, finishedBridges]];
  } else {
    // recurse down, adding our new span options to the queue.
    each(suitableSpans, (span) => {
      bridges.push(addSpanToBridge(span, cloneDeep(bridge)))
    })

    return [findBestBridge, [bridges, finishedBridges]];
  }
});


export const part1 = (ports) => {
  allBridges = cloneDeep(ports);
  let bridgesToCheck = availablePortsWithConnections(ports, "0")
  bridgesToCheck = map(bridgesToCheck, structureize)

  let finishedBridges = findBestBridge(bridgesToCheck, [])
  return chain(finishedBridges)
    .map(b => b.links)
    .map(links => flatten(links))
    .map(link => map(link, (e) => Number(e)))
    .map(link => reduce(link, (acc, v) => acc + v), 0)
    .thru(max)
    .value()
};

export const part2 = (input) => {
};
