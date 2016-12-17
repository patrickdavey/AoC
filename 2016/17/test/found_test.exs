defmodule FoundTest do
  use ExUnit.Case
  alias AOCDay.Found

  test "correctly adds to list" do
    Found.init
    Found.add("abc")
    Found.add("def")

    assert Found.current_state == ["abc", "def"]
  end

end
