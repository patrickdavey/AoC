defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "can solve shortest path" do
    assert Runner.shortest_path_for("ihgpwlah") == "DDRRRD"
    assert Runner.shortest_path_for("kglvqrro") == "DDUDRLRRUDRD"
    assert Runner.shortest_path_for("ulqzkmiv") == "DRURDRUDDLLDLUURRDULRLDUUDDDRR"
  end

  test "can solve longest path" do
    assert Runner.longest_path_for("ihgpwlah") == 370
  end
end
