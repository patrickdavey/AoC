import { reduce, chain, intoLines } from "./utils";

const PARTICLE_REGEX = /p=<([-\d]+),([-\d]+),([-\d]+)>, v=<([-\d]+),([-\d]+),([-\d]+)>, a=<([-\d]+),([-\d]+),([-\d]+)>/

const intoParticles = (string, number) => {
  const match = string.match(PARTICLE_REGEX)
  return {
    particleId: number,
    collided: false,
    position: {
      x: Number(match[1]),
      y: Number(match[2]),
      z: Number(match[3]),
    },
    velocity: {
      x: Number(match[4]),
      y: Number(match[5]),
      z: Number(match[6]),
    },
    acceleration: {
      x: Number(match[7]),
      y: Number(match[8]),
      z: Number(match[9]),
    },
  };
};

export const parse = (raw) => {
  return chain(raw)
    .thru(intoLines)
    .map(intoParticles)
    .value();
};
