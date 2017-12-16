--- Day 16: Permutation Promenade ---
-------------------------------------

You come upon a very unusual sight; a group of programs here appear to
be [dancing](https://www.youtube.com/watch?v=lyZQPjUT5B4&t=53).

There are sixteen programs in total, named `a` through `p`. They start
by standing in a [line]{title="This is called a 'newline'."}: `a` stands
in position `0`, `b` stands in position `1`, and so on until `p`, which
stands in position `15`.

The programs' *dance* consists of a sequence of *dance moves*:

-   *Spin*, written `sX`, makes `X` programs move from the end to the
    front, but maintain their order otherwise. (For example, `s3` on
    `abcde` produces `cdeab`).
-   *Exchange*, written `xA/B`, makes the programs at positions `A` and
    `B` swap places.
-   *Partner*, written `pA/B`, makes the programs named `A` and `B` swap
    places.

For example, with only five programs standing in a line (`abcde`), they
could do the following dance:

-   `s1`, a spin of size `1`: `eabcd`.
-   `x3/4`, swapping the last two programs: `eabdc`.
-   `pe/b`, swapping programs `e` and `b`: `baedc`.

After finishing their dance, the programs end up in order `baedc`.

You watch the dance for a while and record their dance moves (your
puzzle input). *In what order are the programs standing* after their
dance?

To begin, [get your puzzle input](16/input).

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22Permutation+Promenade%22+%2D+Day+16+%2D+Advent+of+Code+2017&url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F16&related=ericwastl&hashtags=AdventOfCode)
[Google+](https://plus.google.com/share?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F16)
[Reddit](http://www.reddit.com/submit?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F16&title=%22Permutation+Promenade%22+%2D+Day+16+%2D+Advent+of+Code+2017)]{.share-content}\]]{.share}
this puzzle.
