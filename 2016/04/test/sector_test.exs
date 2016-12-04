defmodule SectorTest do
  use ExUnit.Case
  alias AOCDay.Sector
  alias AOCDay.Parser

  test "finds sector correctly" do
    assert Parser.formatted("aaaaa-bbb-z-y-x-123[abxyz]").sector == 123
    assert Parser.formatted("a-b-c-d-e-f-g-h-987[abcde] ").sector == 987
    assert Parser.formatted("not-a-real-room-404[oarel]").sector == 404
  end

  test "rotates correctly" do
    assert Sector.rotated(Parser.formatted "qzmt-zixmtkozy-ivhz-343[b]") == { "very encrypted name ", 343 }
  end
end
