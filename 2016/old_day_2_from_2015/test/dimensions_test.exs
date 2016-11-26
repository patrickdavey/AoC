defmodule DimensionsTest do
  use ExUnit.Case
  alias AOCDay.Dimensions
  alias AOCDay.Box

  test "calulates wrapping correctly from sample data" do
    b = %Box{length: 2, width: 3, height: 4}
    assert Dimensions.wrapping(b) == 58

    b = %Box{length: 1, width: 1, height: 10}
    assert Dimensions.wrapping(b) == 43
  end

  test "calulates ribbon correctly from sample data" do
    b = %Box{length: 2, width: 3, height: 4}
    assert Dimensions.ribbon(b) == 34

    b = %Box{length: 1, width: 1, height: 10}
    assert Dimensions.ribbon(b) == 14
  end
end
