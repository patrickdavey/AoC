defmodule DecompressTest do
  use ExUnit.Case
  alias AOCDay.Decompress

  # test "sample data works" do
  #   assert Decompress.word_length("ADVENT") == 6
  #   assert Decompress.word_length("A(1x5)BC") == 7
  #   assert Decompress.word_length("(3x3)XYZ") == 9
  #   assert Decompress.word_length("A(2x2)BCD(2x2)EFG") == 11
  #   assert Decompress.word_length("(6x1)(1x3)A") == 6
  #   assert Decompress.word_length("X(8x2)(3x3)ABCY") == 18
  # end

  test "part 2sample data works" do
    # Application.put_env(:aoc, :recurse, true)
    # assert Decompress.word_length("(3x3)XYZ") == 9
    # assert Decompress.word_length("X(8x2)(3x3)ABCY") == 20
    # assert Decompress.word_length("(27x12)(20x12)(13x14)(7x10)(1x12)A") == 241920
    # assert Decompress.word_length("(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN") == 445
  end

  test "single decompression works" do
    assert Decompress.expand("(3x3)ABC"), {"char_length" => 8, "repeat_times" => 2}, "(3x3)ABC") == "ABCABCABCABCABCABC"
  end
end
