defmodule VisitedTest do
  use ExUnit.Case
  alias AOCDay.Layout
  alias AOCDay.Visited

  test "validates floor index" do
    Visited.init
    layout = %Layout{
      elevator: 0,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute Visited.visited?(layout)
    Visited.add(layout)
    assert Visited.visited?(layout)

    layout = %Layout{
      elevator: 1,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute Visited.visited?(layout)
    Visited.add(layout)
    assert Visited.visited?(layout)
  end
end
