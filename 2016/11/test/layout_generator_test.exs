defmodule LayoutGeneratorTest do
  use ExUnit.Case
  alias AOCDay.Layout
  alias AOCDay.LayoutValidator
  alias AOCDay.LayoutGenerator
  alias AOCDay.Visited

  test "validates floor index" do
    Visited.init
    layout = %Layout{
      steps: [],
      elevator: 0,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }

    nodes = LayoutGenerator.nodes(layout)
            |> Enum.map(&(Map.put(&1, :steps, [])))

    layout2 = %Layout{
      steps: [],
      elevator: 1,
      floor_0: ["LM"],
      floor_1: ["HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    }
    assert Enum.member?(nodes, layout2)

    assert Enum.member?(nodes, %Layout{
      steps: [],
      elevator: 1,
      floor_0: [],
      floor_1: ["HG", "HM", "LM"],
      floor_2: ["LG"],
      floor_3: []
    })

    assert Enum.count(nodes) == 2
  end

  test "ensure no duplicates generated" do
    Visited.init
    layout = %Layout{
      steps: [],
      elevator: 0,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }

    nodes = LayoutGenerator.nodes(layout)
            |> Enum.map(&(Map.put(&1, :steps, [])))

    layout2 = %Layout{
      elevator: 1,
      steps: [],
      floor_0: ["LM"],
      floor_1: ["HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    }

    nodes = LayoutGenerator.nodes(layout2)
    refute Enum.member?(nodes, layout)
  end

  test "second part works" do
    Visited.init
    layout = %Layout{
      steps: [],
      elevator: 1,
      floor_0: ["LM"],
      floor_1: ["HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    }
    nodes = LayoutGenerator.nodes(layout)
            |> Enum.map(&(Map.put(&1, :steps, [])))

    assert Enum.member?(nodes, %Layout{
      steps: [],
      elevator: 2,
      floor_0: ["LM"],
      floor_1: [],
      floor_2: ["HG", "HM", "LG"],
      floor_3: []
    })
  end

  test "third part works" do
    Visited.init
    layout = %Layout{
      steps: [],
      elevator: 2,
      floor_0: ["LM"],
      floor_1: [],
      floor_2: ["HG", "HM", "LG"],
      floor_3: []
    }
    nodes = LayoutGenerator.nodes(layout)
            |> Enum.map(&(Map.put(&1, :steps, [])))

    assert Enum.member?(nodes, %Layout{
      steps: [],
      elevator: 1,
      floor_0: ["LM"],
      floor_1: [ "HM"],
      floor_2: ["HG", "LG"],
      floor_3: []
    })

    assert Enum.member?(nodes, %Layout{
      steps: [],
      elevator: 1,
      floor_0: ["LM"],
      floor_1: [ "HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    })

    assert Enum.member?(nodes, %Layout{
      steps: [],
      elevator: 3,
      floor_0: ["LM"],
      floor_1: [],
      floor_2: ["LG"],
      floor_3: [ "HG", "HM"]
    })

    assert Enum.member?(nodes, %Layout{
      steps: [],
      elevator: 1,
      floor_0: ["LM"],
      floor_1: [ "LG" ],
      floor_2: ["HG", "HM"],
      floor_3: []
    })
  end
end
