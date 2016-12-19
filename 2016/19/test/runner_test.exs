defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "sample data works" do
    assert Runner.who_has_all_presents?(5) == 3
    assert Runner.who_has_all_presents?(6) == 5
  end
end
