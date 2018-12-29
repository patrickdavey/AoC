import re

import z3


def get_nanos(file):
    nanos = []
    with open(file) as f:
        for line in [line.strip() for line in f.read().strip().splitlines()]:
            groups = re.match("pos=<(-?\d+),(-?\d+),(-?\d+)>, r=(\d+)", line).groups()
            nanos.append(((int(groups[0]), int(groups[1]), int(groups[2])), int(groups[3])))

    return nanos


def distance(c1, c2):
    return abs(c1[0] - c2[0]) + abs(c1[1] - c2[1]) + abs(c1[2] - c2[2])


def best_count(n1, nanos):
    count = 0
    for n in nanos:
        if distance(n1[0], n[0]) <= n1[1]:
            count += 1
    return count


def z3abs(n):
    return z3.If(n >= 0, n, -n)


def z3dist(c1, c2):
    return z3abs(c1[0] - c2[0]) + z3abs(c1[1] - c2[1]) + z3abs(c1[2] - c2[2])


def best_point(nanos):
    x, y, z, cost = z3.Ints("x y z cost")
    cost = cost * 0
    for c, r in nanos:
        cost += z3.If(z3dist((x, y, z), c) <= r, 1, 0)
    o = z3.Optimize()
    o.maximize(cost)
    o.minimize(z3dist((0, 0, 0), (x, y, z)))
    o.check()
    model = o.model()
    return distance((0, 0, 0), (model[x].as_long(), model[y].as_long(), model[z].as_long()))


nanos = get_nanos("./input.txt")
maxRadius = max([n[1] for n in nanos])
bestNano = [n for n in nanos if n[1] == maxRadius][0]
print("Answer 1:", best_count(bestNano, nanos))
model = best_point(nanos)
print("Answer 2:", best_point(nanos))
