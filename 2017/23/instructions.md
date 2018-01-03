--- Day 23: Coprocessor Conflagration ---
-----------------------------------------

You decide to head directly to the CPU and fix the printer from there.
As you get close, you find an *experimental coprocessor* doing so much
work that the local programs are afraid it will [halt and catch
fire](https://en.wikipedia.org/wiki/Halt_and_Catch_Fire). This would
cause serious issues for the rest of the computer, so you head in and
see what you can do.

The code it's running seems to be a variant of the kind you saw recently
on that [tablet](18). The general functionality seems *very similar*,
but some of the instructions are different:

-   `set X Y` *sets* register `X` to the value of `Y`.
-   `sub X Y` *decreases* register `X` by the value of `Y`.
-   `mul X Y` sets register `X` to the result of *multiplying* the value
    contained in register `X` by the value of `Y`.
-   `jnz X Y` *jumps* with an offset of the value of `Y`, but only if
    the value of `X` is *not zero*. (An offset of `2` skips the next
    instruction, an offset of `-1` jumps to the previous instruction,
    and so on.)

The coprocessor is currently set to some kind of *debug mode*, which
allows for testing, but prevents it from doing any meaningful work.

If you run the program (your puzzle input), *how many times is the `mul`
instruction invoked?*

To begin, [get your puzzle input](23/input).

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22Coprocessor+Conflagration%22+%2D+Day+23+%2D+Advent+of+Code+2017&url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F23&related=ericwastl&hashtags=AdventOfCode)
[Google+](https://plus.google.com/share?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F23)
[Reddit](http://www.reddit.com/submit?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F23&title=%22Coprocessor+Conflagration%22+%2D+Day+23+%2D+Advent+of+Code+2017)]{.share-content}\]]{.share}
this puzzle.
