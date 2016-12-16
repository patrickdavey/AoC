defmodule ChecksumTest do
  use ExUnit.Case
  alias AOCDay.Checksum

  test "inital data correctly encoded" do
    assert Checksum.create!("110010110100") == "100"
    assert Checksum.create!("10000011110010000111") == "01100"
  end
end
