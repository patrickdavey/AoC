--- Day 19: An Elephant Named Joseph ---
----------------------------------------

The Elves contact you over a highly secure emergency channel. Back at
the North Pole, the Elves are busy <span
title="Eggnoggedly misunderstanding them, actually.">misunderstanding</span>
[White Elephant
parties](https://en.wikipedia.org/wiki/White_elephant_gift_exchange).

Each Elf brings a present. They all sit in a circle, numbered starting
with position `1`. Then, starting with the first Elf, they take turns
stealing all the presents from the Elf to their left. An Elf with no
presents is removed from the circle and does not take turns.

For example, with five Elves (numbered `1` to `5`):

      1
    5   2
     4 3

-   Elf `1` takes Elf `2`'s present.
-   Elf `2` has no presents and is skipped.
-   Elf `3` takes Elf `4`'s present.
-   Elf `4` has no presents and is also skipped.
-   Elf `5` takes Elf `1`'s two presents.
-   Neither Elf `1` nor Elf `2` have any presents, so both are skipped.
-   Elf `3` takes Elf `5`'s three presents.

So, with *five* Elves, the Elf that sits starting in position `3` gets
all the presents.

With the number of Elves given in your puzzle input, *which Elf gets all
the presents?*

Your puzzle input is `3012210`{.puzzle-input}.

Answer:

You can also <span class="share">\[Share<span class="share-content">on
[Twitter](https://twitter.com/intent/tweet?text=%22An+Elephant+Named+Joseph%22+%2D+Day+19+%2D+Advent+of+Code+2016&url=http%3A%2F%2Fadventofcode%2Ecom%2F2016%2Fday%2F19&related=ericwastl&hashtags=AdventOfCode)
[Google+](https://plus.google.com/share?url=http%3A%2F%2Fadventofcode%2Ecom%2F2016%2Fday%2F19)
[Reddit](http://www.reddit.com/submit?url=http%3A%2F%2Fadventofcode%2Ecom%2F2016%2Fday%2F19&title=%22An+Elephant+Named+Joseph%22+%2D+Day+19+%2D+Advent+of+Code+2016)</span>\]</span>
this puzzle.
