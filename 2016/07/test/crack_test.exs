defmodule CrackTest do
  use ExUnit.Case
  alias AOCDay.Runner

  # test "finds test crack correctly" do
  #   assert Crack.code_for("abc") == "18F47A30"
  # end

  test "finds final test crack correctly" do
    assert Runner.valid_ipv7("abba[mnop]qrst")
    refute Runner.valid_ipv7("abcd[bddb]xyyx")
    refute Runner.valid_ipv7("aaaa[qwer]tyui")
    assert Runner.valid_ipv7("ioxxoj[asdfgh]zxcvbn")
  end

  test "finds valid_ssl" do
    assert Runner.valid_ssl("aba[bab]xyz")
    assert Runner.valid_ssl("aba[bhhhhhhab]xyzasdfksdf[sdfsdfsdf][vvvvvbabvvvv]")
    refute Runner.valid_ssl("xyx[xyx]xyx")
    assert Runner.valid_ssl("aaa[kek]eke")
    assert Runner.valid_ssl("aaa[aaa]ekezazbz[bzb]cdb")
    assert Runner.valid_ssl("[xxxabaxxx]asjhdfjhsdbbbab")
    refute Runner.valid_ssl("[babxxx][xxxabaxxxbab][bab]")
    assert Runner.valid_ssl("babxxx[xxxabaxxxbab][bab]")
    assert Runner.valid_ssl("xxxxxxaba[babxxxxxxxx]xxxx[xxxxxxx]")
    assert Runner.valid_ssl("xxxxxxaba[xxxxxxxx]xxxx[babxxxxxxx]")
    assert Runner.valid_ssl("[babxxx][xxxabaxxxbab][bab]xxxxxxaba[xxxxxxxx]xxxx[babxxxxxxx]")
    assert Runner.valid_ssl("[bababab]xxxxxxaba[xxxxxxxx]xxxx[babxxxxxxx][babxxx][xxxabaxxxbab]")
    assert Runner.valid_ssl("[xxxxxxaba][xxxxxxxx]xxxx[babxxxxxxx]bab")
    assert Runner.valid_ssl("bab[xxxxxx][xxxxxxxx]xxxx[babaxxxxxxx]")
    assert Runner.valid_ssl("abab[xxxxxx][xxxxxxxx]xxxx[babaxxxxxxx]")
    assert Runner.valid_ssl("[baba]abab[xxxxxx][xxxxxxxx]xxxx[xxbabaxxxxx]")
    assert Runner.valid_ssl("xyx[xyx]xyx[aaayxyaa]")
    assert Runner.valid_ssl("xyx[xyx]xyx[aaayxyaa]")
  end
end
# (?=(\w)(\w)\1(?![^[]*])(?=.*\2\1\2.*(?![^[]*])))
