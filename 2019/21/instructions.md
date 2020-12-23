--- Day 21: Springdroid Adventure ---
-------------------------------------

You lift off from Pluto and start flying in the direction of Santa.

While experimenting further with the tractor beam, you accidentally pull
an asteroid directly into your ship! It deals significant damage to your
hull and causes your ship to begin tumbling violently.

You can send a droid out to investigate, but the tumbling is causing
enough [artificial
gravity](https://en.wikipedia.org/wiki/Artificial_gravity) that one
wrong step could send the droid through a hole in the hull and flying
out into space.

The clear choice for this mission is a
[droid]{title="I picture the Bouncy enemy from Kirby games."} that can
*jump* over the holes in the hull - a *springdroid*.

You can use an [Intcode](9) program (your puzzle input) running on an
[ASCII-capable](17) computer to
[program](https://en.wikipedia.org/wiki/Programmable_read-only_memory)
the springdroid. However, springdroids don't run Intcode; instead, they
run a simplified assembly language called *springscript*.

While a springdroid is certainly capable of navigating the artificial
gravity and giant holes, it has one downside: it can only remember at
most *15* springscript instructions.

The springdroid will move forward automatically, constantly thinking
about *whether to jump*. The springscript program defines the logic for
this decision.

Springscript programs only use [Boolean
values](https://en.wikipedia.org/wiki/Boolean_data_type), not numbers or
strings. Two registers are available: `T`, the *temporary value*
register, and `J`, the *jump* register. If the jump register is *true*
at the end of the springscript program, the springdroid will try to
jump. Both of these registers start with the value *false*.

Springdroids have a sensor that can detect *whether there is ground* at
various distances in the direction it is facing; these values are
provided in *read-only registers*. Your springdroid can detect ground at
four distances: one tile away (`A`), two tiles away (`B`), three tiles
away (`C`), and four tiles away (`D`). If there is ground at the given
distance, the register will be *true*; if there is a hole, the register
will be *false*.

There are only *three instructions* available in springscript:

-   `AND X Y` sets `Y` to *true* if both `X` and `Y` are *true*;
    otherwise, it sets `Y` to *false*.
-   `OR X Y` sets `Y` to *true* if at least one of `X` or `Y` is *true*;
    otherwise, it sets `Y` to *false*.
-   `NOT X Y` sets `Y` to *true* if `X` is *false*; otherwise, it sets
    `Y` to *false*.

In all three instructions, the second argument (`Y`) needs to be a
*writable register* (either `T` or `J`). The first argument (`X`) can be
*any register* (including `A`, `B`, `C`, or `D`).

For example, the one-instruction program `NOT A J` means "if the tile
immediately in front of me is not ground, jump".

Or, here is a program that jumps if a three-tile-wide hole (with ground
on the other side of the hole) is detected:

    NOT A J
    NOT B T
    AND T J
    NOT C T
    AND T J
    AND D J

The Intcode program expects ASCII inputs and outputs. It will begin by
displaying a prompt; then, input the desired instructions one per line.
End each line with a newline (ASCII code `10`). *When you have finished
entering your program*, provide the command `WALK` followed by a newline
to instruct the springdroid to begin surveying the hull.

If the springdroid *falls into space*, an ASCII rendering of the last
moments of its life will be produced. In these, `@` is the springdroid,
`#` is hull, and `.` is empty space. For example, suppose you program
the springdroid like this:

    NOT D J
    WALK

This one-instruction program sets `J` to *true* if and only if there is
no ground four tiles away. In other words, it attempts to jump into any
hole it finds:

    .................
    .................
    @................
    #####.###########

    .................
    .................
    .@...............
    #####.###########

    .................
    ..@..............
    .................
    #####.###########

    ...@.............
    .................
    .................
    #####.###########

    .................
    ....@............
    .................
    #####.###########

    .................
    .................
    .....@...........
    #####.###########

    .................
    .................
    .................
    #####@###########

However, if the springdroid successfully makes it across, it will use an
output instruction to indicate the *amount of damage to the hull* as a
single giant integer outside the normal ASCII range.

Program the springdroid with logic that allows it to survey the hull
without falling into space. *What amount of hull damage does it report?*

To begin, [get your puzzle input](21/input).

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22Springdroid+Adventure%22+%2D+Day+21+%2D+Advent+of+Code+2019&url=https%3A%2F%2Fadventofcode%2Ecom%2F2019%2Fday%2F21&related=ericwastl&hashtags=AdventOfCode)
[Mastodon](javascript:void(0);)]{.share-content}\]]{.share} this puzzle.
