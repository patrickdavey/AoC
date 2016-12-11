defmodule VisitedTest do
  use ExUnit.Case
  alias AOCDay.Layout
  alias AOCDay.Visited

  test "validates floor index" do
    Visited.init
    layout = %Layout{
      steps: 0,
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
      steps: 0,
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

  test "number of steps is ignored" do
    Visited.init
    layout = %Layout{
      steps: 0,
      elevator: 1,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute Visited.visited?(layout)
    Visited.add(layout)
    assert Visited.visited?(layout)

    layout = %Layout{
      steps: 1,
      elevator: 1,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    assert Visited.visited?(layout)


  end
end
