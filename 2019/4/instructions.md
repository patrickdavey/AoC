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

Your puzzle input is `123257-647015`{.puzzle-input}.

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22Secure+Container%22+%2D+Day+4+%2D+Advent+of+Code+2019&url=https%3A%2F%2Fadventofcode%2Ecom%2F2019%2Fday%2F4&related=ericwastl&hashtags=AdventOfCode)
[Mastodon](javascript:void(0);)]{.share-content}\]]{.share} this puzzle.
