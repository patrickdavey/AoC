defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.{Parser,Point, Velocity}

  test "initial config works" do
    [a, b, c, d] = Parser.parse(
      """
    <x=-1, y=0, z=2>
    <x=2, y=-10, z=-7>
    <x=4, y=-8, z=8>
    <x=3, y=5, z=-1>
      """
    )

    assert(a == {%Point{x: -1, y: 0, z: 2}, %Velocity{vx: 0, vy: 0, vz: 0}})
  end
end
