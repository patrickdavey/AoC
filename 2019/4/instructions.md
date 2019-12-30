--- Day 4: Secure Container ---
-------------------------------

You arrive at the Venus fuel depot only to discover it's protected by a
password. The Elves had written the password on a sticky note, but
someone [threw it
out]{title="Look on the bright side - isn't it more secure if nobody knows the password?"}.

However, they do remember a few key facts about the password:

-   It is a six-digit number.
-   The value is within the range given in your puzzle input.
-   Two adjacent digits are the same (like `22` in `122345`).
-   Going from left to right, the digits *never decrease*; they only
    ever increase or stay the same (like `111123` or `135679`).

Other than the range rule, the following are true:

-   `111111` meets these criteria (double `11`, never decreases).
-   `223450` does not meet these criteria (decreasing pair of digits
    `50`).
-   `123789` does not meet these criteria (no double).

*How many different passwords* within the range given in your puzzle
input meet these criteria?

Your puzzle answer was `2220`.

The first half of this puzzle is complete! It provides one gold star: \*

--- Part Two --- {#part2}
----------------

An Elf just remembered one more important detail: the two adjacent
matching digits *are not part of a larger group of matching digits*.

Given this additional criterion, but still ignoring the range rule, the
following are now true:

-   `112233` meets these criteria because the digits never decrease and
    all repeated digits are exactly two digits long.
-   `123444` no longer meets the criteria (the repeated `44` is part of
    a larger group of `444`).
-   `111122` meets the criteria (even though `1` is repeated more than
    twice, it still contains a double `22`).

*How many different passwords* within the range given in your puzzle
input meet all of the criteria?

Your puzzle input is still `123257-647015`{.puzzle-input}.

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=I%27ve+completed+Part+One+of+%22Secure+Container%22+%2D+Day+4+%2D+Advent+of+Code+2019&url=https%3A%2F%2Fadventofcode%2Ecom%2F2019%2Fday%2F4&related=ericwastl&hashtags=AdventOfCode)
[Mastodon](javascript:void(0);)]{.share-content}\]]{.share} this puzzle.
