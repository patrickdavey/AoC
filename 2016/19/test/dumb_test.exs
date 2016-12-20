defmodule DumbTest do
  use ExUnit.Case
  alias AOCDay.Dumb

  test "sample data works" do
    assert Dumb.who_has_all_presents?(10) == 1
    Enum.each(1..1000, fn(i) ->
      ans = Dumb.who_has_all_presents?(i)
      IO.puts "#{i}: #{ans}"
    end)
  end
end
