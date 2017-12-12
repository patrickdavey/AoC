--- Day 11: Hex Ed ---
----------------------

Crossing the bridge, you've barely reached the other side of the stream
when a program comes up to you, clearly in distress. "It's my child
process," she says, "he's gotten lost in an infinite grid!"

Fortunately for her, you have plenty of experience with infinite grids.

Unfortunately for you, it's a [hex
grid](https://en.wikipedia.org/wiki/Hexagonal_tiling).

The hexagons ("hexes") in [this
grid]{title="Raindrops on roses and whiskers on kittens."} are aligned
such that adjacent hexes can be found to the north, northeast,
southeast, south, southwest, and northwest:

      \ n  /
    nw +--+ ne
      /    \
    -+      +-
      \    /
    sw +--+ se
      / s  \

You have the path the child process took. Starting where he started, you
need to determine the fewest number of steps required to reach him. (A
"step" means to move from the hex you are in to any adjacent hex.)

For example:

-   `ne,ne,ne` is `3` steps away.
-   `ne,ne,sw,sw` is `0` steps away (back where you started).
-   `ne,ne,s,s` is `2` steps away (`se,se`).
-   `se,sw,se,sw,sw` is `3` steps away (`s,s,sw`).

Your puzzle answer was `707`.

--- Part Two ---
----------------

*How many steps away* is the *furthest* he ever got from his starting
position?

Your puzzle answer was `1490`.

Both parts of this puzzle are complete! They provide two gold stars:
\*\*

At this point, you should [return to your advent calendar](/2017) and
try another puzzle.

If you still want to see it, you can [get your puzzle input](11/input).

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=I%27ve+completed+%22Hex+Ed%22+%2D+Day+11+%2D+Advent+of+Code+2017&url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F11&related=ericwastl&hashtags=AdventOfCode)
[Google+](https://plus.google.com/share?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F11)
[Reddit](http://www.reddit.com/submit?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F11&title=I%27ve+completed+%22Hex+Ed%22+%2D+Day+11+%2D+Advent+of+Code+2017)]{.share-content}\]]{.share}
this puzzle.
