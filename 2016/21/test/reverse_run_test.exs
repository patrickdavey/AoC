defmodule ReverseTest do
  use ExUnit.Case
  alias AOCDay.ReversePasswordGenerator
  alias AOCDay.Parser

  test "more specific tests" do
    ReversePasswordGenerator.start_link("hcdefbag", :reverse_generator)

    Parser.parse
    |> Enum.reverse
    |> Enum.each(fn(i) ->
      GenServer.call(:reverse_generator, i)
    end)

    assert GenServer.call(:reverse_generator, :current_password) == "abcdefgh"
  end
end
