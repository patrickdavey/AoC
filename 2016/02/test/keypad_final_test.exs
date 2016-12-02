defmodule KeypadFinalTest do
  use ExUnit.Case
  alias AOCDay.KeypadFinal

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
