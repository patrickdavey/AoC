defmodule DragonEncoderTest do
  use ExUnit.Case
  alias AOCDay.DragonEncoder

  test "inital data correctly encoded" do
    assert DragonEncoder.encode("1") == "100"
    assert DragonEncoder.encode("0") == "001"
    assert DragonEncoder.encode("11111") == "11111000000"
    assert DragonEncoder.encode("111100001010") == "1111000010100101011110000"
  end
end
