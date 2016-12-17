defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "can solve test data" do
    assert Runner.shortest_path_for("ihgpwlah") == "DDRRRD"
    assert Runner.shortest_path_for("kglvqrro") == "DDUDRLRRUDRD"
    assert Runner.shortest_path_for("ulqzkmiv") == "DRURDRUDDLLDLUURRDULRLDUUDDDRR"
  end
end
