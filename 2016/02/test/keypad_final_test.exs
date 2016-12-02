defmodule KeypadFinalTest do
  use ExUnit.Case
  alias AOCDay.KeypadFinal
  @moduledoc """
    1
  2 3 4
5 6 7 8 9
  A B C
    D
    """

  test "calulates next positions for 1 correctly" do
    assert KeypadFinal.next("1", "U") == "1"
    assert KeypadFinal.next("1", "D") == "3"
    assert KeypadFinal.next("1", "L") == "1"
    assert KeypadFinal.next("1", "R") == "1"
  end

  test "calulates next positions for B correctly" do
    assert KeypadFinal.next("B", "U") == "7"
    assert KeypadFinal.next("B", "D") == "D"
    assert KeypadFinal.next("B", "L") == "A"
    assert KeypadFinal.next("B", "R") == "C"
  end
end
