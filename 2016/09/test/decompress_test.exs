defmodule DecompressTest do
  use ExUnit.Case
  alias AOCDay.Decompress

  test "sample data works" do
    assert Decompress.word_length("ADVENT") == 6
    assert Decompress.word_length("A(1x5)BC") == 7
    assert Decompress.word_length("(3x3)XYZ") == 9
    assert Decompress.word_length("A(2x2)BCD(2x2)EFG") == 11
    assert Decompress.word_length("(6x1)(1x3)A") == 6
    assert Decompress.word_length("X(8x2)(3x3)ABCY") == 18
  end
end
