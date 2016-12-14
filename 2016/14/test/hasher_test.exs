defmodule AOCDay.HasherTest do
  use ExUnit.Case
  alias AOCDay.Hasher

  test "correctly finds first key" do
    Application.put_env(:aoc, :num_hashes, 1)
    Application.put_env(:aoc, :salt, "abc")

    assert "577571be4de9dcce85a041ba0410f29f" == Hasher.hash(0)

    Application.put_env(:aoc, :num_hashes, 2017)
    assert "a107ff634856bb300138cac6568c0f24" == Hasher.hash(0)
  end
end
