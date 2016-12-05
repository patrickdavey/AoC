defmodule CrackTest do
  use ExUnit.Case
  alias AOCDay.Crack

  # test "finds test crack correctly" do
  #   assert Crack.code_for("abc") == "18F47A30"
  # end

  test "finds final test crack correctly" do
    assert Crack.final_code_for("abc") == "05ACE8E3"
  end

end
