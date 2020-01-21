defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Velocity,Parser,Point,Runner}

  test "initial config works after 1 run" do
    [a, b, c, d] = Runner.run_for(simple_state(), 1)
    assert(a == {%Point{x: 2, y: -1, z: 1}, %Velocity{vx: 3, vy: -1, vz: -1}})
  end

  test "initial config works after 10 runs" do
    [a, b, c, d] = Runner.run_for(simple_state(), 10)
    assert(a == {%Point{x: 2, y: 1, z: -3}, %Velocity{vx: -3, vy: -2, vz: 1}})
    assert(b == {%Point{x: 1, y: -8, z: 0}, %Velocity{vx: -1, vy: 1, vz: 3}})
    assert(c == {%Point{x: 3, y: -6, z: 1}, %Velocity{vx: 3, vy: 2, vz: -3}})
    assert(d == {%Point{x: 2, y: 0, z: 4}, %Velocity{vx: 1, vy: -1, vz: -1}})
  end

  test "total energy after 10 steps" do
    result = Runner.energy_after(simple_state(), 10)
    assert(result == 179)
  end

  test "total energy after 100 steps" do
    result = Runner.energy_after(long_state(), 100)
    assert(result == 1940)
  end

  test "repeat after" do
    result = Runner.repeat_after(simple_state, simple_state, 0)
    assert(result == 2772)
  end

  test "long repeat after" do
    result = Runner.repeat_after(long_state, long_state, 0)
    assert(result == 4686774924)
  end

  defp simple_state() do
    Parser.parse(
      """
    <x=-1, y=0, z=2>
    <x=2, y=-10, z=-7>
    <x=4, y=-8, z=8>
    <x=3, y=5, z=-1>
      """
    )
  end

  defp long_state() do
    Parser.parse(
      """
    <x=-8, y=-10, z=0>
    <x=5, y=5, z=10>
    <x=2, y=-7, z=3>
    <x=9, y=-8, z=-3>
      """
    )
  end
end
