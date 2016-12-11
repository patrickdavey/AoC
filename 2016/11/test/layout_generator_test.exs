defmodule LayoutGeneratorTest do
  use ExUnit.Case
  alias AOCDay.Layout
  alias AOCDay.LayoutValidator
  alias AOCDay.LayoutGenerator

  test "validates floor index" do
    layout = %Layout{
      elevator: 0,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }

    nodes = LayoutGenerator.nodes(layout)
    assert Enum.member?(nodes, %Layout{
      elevator: 1,
      floor_0: ["LM"],
      floor_1: ["HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    })

    assert Enum.member?(nodes, %Layout{
      elevator: 1,
      floor_0: [],
      floor_1: ["HG", "HM", "LM"],
      floor_2: ["LG"],
      floor_3: []
    })

    assert Enum.count(nodes) == 2
  end

  test "second part works" do
    layout = %Layout{
      elevator: 1,
      floor_0: ["LM"],
      floor_1: ["HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    }
    nodes = LayoutGenerator.nodes(layout)

    assert Enum.member?(nodes, %Layout{
      elevator: 2,
      floor_0: ["LM"],
      floor_1: [],
      floor_2: ["HG", "HM", "LG"],
      floor_3: []
    })
  end

  test "third part works" do
    layout = %Layout{
      elevator: 2,
      floor_0: ["LM"],
      floor_1: [],
      floor_2: ["HG", "HM", "LG"],
      floor_3: []
    }
    nodes = LayoutGenerator.nodes(layout)

    assert Enum.member?(nodes, %Layout{
      elevator: 1,
      floor_0: ["LM"],
      floor_1: [ "HM"],
      floor_2: ["HG", "LG"],
      floor_3: []
    })

    assert Enum.member?(nodes, %Layout{
      elevator: 1,
      floor_0: ["LM"],
      floor_1: [ "HG", "HM"],
      floor_2: ["LG"],
      floor_3: []
    })

    assert Enum.member?(nodes, %Layout{
      elevator: 3,
      floor_0: ["LM"],
      floor_1: [],
      floor_2: ["LG"],
      floor_3: [ "HG", "HM"]
    })

    assert Enum.member?(nodes, %Layout{
      elevator: 1,
      floor_0: ["LM"],
      floor_1: [ "LG" ],
      floor_2: ["HG", "HM"],
      floor_3: []
    })
  end
end
