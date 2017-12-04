--- Day 3: Spiral Memory ---
----------------------------

You come across an experimental new kind of memory stored on an
[infinite two-dimensional
grid]{title="Good thing we have all these infinite two-dimensional grids lying around!"}.

Each square on the grid is allocated in a spiral pattern starting at a
location marked `1` and then counting up while spiraling outward. For
example, the first few squares are allocated like this:

    17  16  15  14  13
    18   5   4   3  12
    19   6   1   2  11
    20   7   8   9  10
    21  22  23---> ...

While this is very space-efficient (no squares are skipped), requested
data must be carried back to square `1` (the location of the only access
port for this memory system) by programs that can only move up, down,
left, or right. They always take the shortest path: the [Manhattan
Distance](https://en.wikipedia.org/wiki/Taxicab_geometry) between the
location of the data and square `1`.

For example:

-   Data from square `1` is carried `0` steps, since it's at the access
    port.
-   Data from square `12` is carried `3` steps, such as: down, left,
    left.
-   Data from square `23` is carried only `2` steps: up twice.
-   Data from square `1024` must be carried `31` steps.

*How many steps* are required to carry the data from the square
identified in your puzzle input all the way to the access port?

Your puzzle input is `325489`{.puzzle-input}.

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22Spiral+Memory%22+%2D+Day+3+%2D+Advent+of+Code+2017&url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F3&related=ericwastl&hashtags=AdventOfCode)
[Google+](https://plus.google.com/share?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F3)
[Reddit](http://www.reddit.com/submit?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F3&title=%22Spiral+Memory%22+%2D+Day+3+%2D+Advent+of+Code+2017)]{.share-content}\]]{.share}
this puzzle.
