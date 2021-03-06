defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner
  alias AOCDay.Layout

  test "finds shortest path" do
     initial = %Layout{
      steps: [],
       elevator: 0,
        floor_0: ["HM", "LM"],
        floor_1: ["HG"],
        floor_2: ["LG"],
        floor_3: []
      }
    layout = %Layout{
      steps: [initial],
      elevator: 0,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    assert Runner.shortest_path(layout) == 9
  end
end
