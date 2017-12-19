--- Day 19: A Series of Tubes ---
---------------------------------

Somehow, a network packet got
[lost]{title="I know how fast it's going, but I don't know where it is."}
and ended up here. It's trying to follow a routing diagram (your puzzle
input), but it's confused about where to go.

Its starting point is just off the top of the diagram. Lines (drawn with
`|`, `-`, and `+`) show the path it needs to take, starting by going
down onto the only line connected to the top of the diagram. It needs to
follow this path until it reaches the end (located somewhere within the
diagram) and stop there.

Sometimes, the lines cross over each other; in these cases, it needs to
continue going the same direction, and only turn left or right when
there's no other option. In addition, someone has left *letters* on the
line; these also don't change its direction, but it can use them to keep
track of where it's been. For example:

         |          
         |  +--+    
         A  |  C    
     F---|----E|--+ 
         |  |  |  D 
         +B-+  +--+ 

Given this diagram, the packet needs to take the following path:

-   Starting at the only line touching the top of the diagram, it must
    go down, pass through `A`, and continue onward to the first `+`.
-   Travel right, up, and right, passing through `B` in the process.
-   Continue down (collecting `C`), right, and up (collecting `D`).
-   Finally, go all the way left through `E` and stopping at `F`.

Following the path to the end, the letters it sees on its path are
`ABCDEF`.

The little packet looks up at you, hoping you can help it find the way.
*What letters will it see* (in the order it would see them) if it
follows the path? (The routing diagram is very wide; make sure you view
it without line wrapping.)

To begin, [get your puzzle input](19/input).

Answer:

You can also [\[Share[on
[Twitter](https://twitter.com/intent/tweet?text=%22A+Series+of+Tubes%22+%2D+Day+19+%2D+Advent+of+Code+2017&url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F19&related=ericwastl&hashtags=AdventOfCode)
[Google+](https://plus.google.com/share?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F19)
[Reddit](http://www.reddit.com/submit?url=http%3A%2F%2Fadventofcode%2Ecom%2F2017%2Fday%2F19&title=%22A+Series+of+Tubes%22+%2D+Day+19+%2D+Advent+of+Code+2017)]{.share-content}\]]{.share}
this puzzle.
