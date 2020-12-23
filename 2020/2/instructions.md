--- Day 2: Password Philosophy ---
----------------------------------

Your flight departs in a few days from the coastal airport; the easiest
way down to the coast from here is via
[toboggan](https://en.wikipedia.org/wiki/Toboggan).

The shopkeeper at the North Pole Toboggan Rental Shop is having a bad
day. "Something's wrong with our computers; we can't log in!" You ask if
you can take a look.

Their password database seems to be a little corrupted: some of the
passwords wouldn't have been allowed by the [Official Toboggan Corporate
Policy]{title="To ensure your safety, your password must be the following string..."}
that was in effect when they were chosen.

To try to debug the problem, they have created a list (your puzzle
input) of *passwords* (according to the corrupted database) and *the
corporate policy when that password was set*.

For example, suppose you have the following list:

    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc

Each line gives the password policy and then the password. The password
policy indicates the lowest and highest number of times a given letter
must appear for the password to be valid. For example, `1-3 a` means
that the password must contain `a` at least `1` time and at most `3`
times.

In the above example, `2` passwords are valid. The middle password,
`cdefg`, is not; it contains no instances of `b`, but needs at least
`1`. The first and third passwords are valid: they contain one `a` or
nine `c`, both within the limits of their respective policies.

*How many passwords are valid* according to their policies?

To begin, [get your puzzle input](2/input).

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22Password+Philosophy%22+%2D+Day+2+%2D+Advent+of+Code+2020&url=https%3A%2F%2Fadventofcode%2Ecom%2F2020%2Fday%2F2&related=ericwastl&hashtags=AdventOfCode)
[Mastodon](javascript:void(0);)]{.share-content}\]]{.share} this puzzle.
