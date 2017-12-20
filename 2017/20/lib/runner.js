import { difference, isEqual, chain, some } from "./utils";

const updatePositions = (particle, value, collection) => {
  particle.velocity.x += particle.acceleration.x;
  particle.velocity.y += particle.acceleration.y;
  particle.velocity.z += particle.acceleration.z;

  particle.position.x += particle.velocity.x;
  particle.position.y += particle.velocity.y;
  particle.position.z += particle.velocity.z;
}

const distanceFromZero = ({position: {x, y, z}}) => {
  return Math.abs(x) + Math.abs(y) + Math.abs(z);
}


export const part1 = (particles) => {
  let closest = null;
  let timesSameClosest = 0;
  while (timesSameClosest < 10000) {
    let newClosestId = chain(particles)
    .each(updatePositions)
    .minBy(distanceFromZero)
    .thru(p => p.particleId)
    .value()

    if (newClosestId != closest) {
      closest = newClosestId;
      timesSameClosest = 0;
    } else {
      timesSameClosest += 1;
    }
  }

  return closest;
};

const hasCollision = (value, index, collection) => {
  return some(collection, (val, idx) => idx !== index && isEqual(val.position, value.position))
};

export const part2 = (particles) => {
  let mapSize = particles.length;
  let timeNoCollision = 0;
  while (timeNoCollision < 400) {
    let filtered = chain(particles)
    .each(updatePositions)
    .filter(hasCollision)
    .value()

    particles = difference(particles, filtered)
    console.log(mapSize)

    if (particles.length < mapSize) {
      console.log(mapSize)
      mapSize = particles.length;
      timeNoCollision = 0;
    } else {
      timeNoCollision += 1;
    }
  }

  return mapSize;
};
