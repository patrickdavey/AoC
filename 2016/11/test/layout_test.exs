defmodule LayoutTest do
  use ExUnit.Case
  alias AOCDay.Layout
  alias AOCDay.LayoutValidator

  test "validates floor index" do
    layout = %Layout{
      steps: 4,
      elevator: 4,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute LayoutValidator.valid?(layout)

    layout = %Layout{
      steps: 4,
      elevator: -1,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute LayoutValidator.valid?(layout)

    layout = %Layout{
      steps: 4,
      elevator: 0,
      floor_0: [],
      floor_1: [],
      floor_2: [],
      floor_3: []
    }
    assert LayoutValidator.valid?(layout)

    layout = %Layout{
      steps: 4,
      elevator: 0,
      floor_0: ["HM"],
      floor_1: ["HG", "LM"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute LayoutValidator.valid?(layout)

    layout = %Layout{
      steps: 4,
      elevator: 0,
      floor_0: ["HM", "HG", "LM"],
      floor_1: [],
      floor_2: ["LG"],
      floor_3: []
    }
    assert LayoutValidator.valid?(layout)

    layout = %Layout{
      steps: 4,
      elevator: 0,
      floor_0: [],
      floor_1: [],
      floor_2: [],
      floor_3: ["HM", "HG", "LM", "LG"]
    }
    assert LayoutValidator.valid?(layout)

    layout = %Layout{
      steps: 4,
      elevator: 0,
      floor_0: ["JM", "QM", "BM"],
      floor_1: ["AG", "BG"],
      floor_2: [],
      floor_3: ["HM", "HG", "LM", "LG"]
    }
    assert LayoutValidator.valid?(layout)
  end
end
