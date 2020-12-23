defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.{Parser}

  test "parse first maze correctly" do
    s = """
         A           
         A           
  #######.#########  
  #######.........#  
  #######.#######.#  
  #######.#######.#  
  #######.#######.#  
  #####  B    ###.#  
BC...##  C    ###.#  
  ##.##       ###.#  
  ##...DE  F  ###.#  
  #####    G  ###.#  
  #########.#####.#  
DE..#######...###.#  
  #.#########.###.#  
FG..#########.....#  
  ###########.#####  
             Z       
             Z       
"""

    parsed = Parser.parse(s)
    assert(parsed.start == {9, 2})
    assert(parsed.finish == {13, 16})
  end
end
