defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "initial data encodes correctly" do
    assert Runner.find_checksum_for("10000", 20) == "01100"
    assert Runner.find_checksum_for("10001110011110000", 272) == "10010101010011101"
  end
end
