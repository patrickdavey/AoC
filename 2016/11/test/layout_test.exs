defmodule LayoutTest do
  use ExUnit.Case
  alias AOCDay.Layout
  alias AOCDay.LayoutValidator

  test "validates floor index" do
    layout = %Layout{
      elevator: 4,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute LayoutValidator.valid?(layout)

    layout = %Layout{
      elevator: -1,
      floor_0: ["HM", "LM"],
      floor_1: ["HG"],
      floor_2: ["LG"],
      floor_3: []
    }
    refute LayoutValidator.valid?(layout)
  end
end
