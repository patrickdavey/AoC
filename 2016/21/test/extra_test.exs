defmodule ExtraTest do
  use ExUnit.Case
  alias AOCDay.PasswordGenerator

  test "letter based rotations" do
    PasswordGenerator.start_link("cdhegfab", :generator)
    GenServer.call(:generator, "rotate based on position of letter b", 1000000)
  end
end
