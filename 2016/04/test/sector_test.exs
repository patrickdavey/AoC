defmodule SectorTest do
  use ExUnit.Case
  alias AOCDay.Sector
  alias AOCDay.Parser

  test "finds code correctly" do
    assert Sector.letters(Parser.formatted "aaaaa-bbb-z-y-x-123[abxyz]") == 123
    assert Sector.letters(Parser.formatted "a-b-c-d-e-f-g-h-987[abcde] ") == 987
    assert Sector.letters(Parser.formatted "not-a-real-room-404[oarel]") == 404
    refute Sector.letters(Parser.formatted "totally-real-room-200[decoy]")
  end

  test "rotates correctly" do
    assert Sector.rotated(Parser.formatted "qzmt-zixmtkozy-ivhz-343[b]") == { "very encrypted name ", 343 }
  end
end
