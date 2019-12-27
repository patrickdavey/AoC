defmodule AOCIncodeTest do
  use ExUnit.Case
  alias AOC.Intcode

  test "initial states work" do
    assert(Intcode.next([1,0,0,0,99], 0) == [2,0,0,0,99])
    assert(Intcode.next([2,3,0,3,99], 0) == [2,3,0,6,99])
    assert(Intcode.next([2,4,4,5,99,0], 0) == [2,4,4,5,99,9801])
  end

  test "full runs" do
    assert(Intcode.next([1,1,1,4,99,5,6,0,99], 0) == [30,1,1,4,2,5,6,0,99])
    assert(Intcode.next([1,9,10,3,2,3,11,0,99,30,40,50], 0) == [3500,9,10,70, 2,3,11,0, 99, 30,40,50])
  end
end
