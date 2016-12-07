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
    refute Runner.valid_ssl("xyx[xyx]xyx")
    assert Runner.valid_ssl("aaa[kek]eke")
    assert Runner.valid_ssl("zazbz[bzb]cdb")
  end
end
