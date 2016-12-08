defmodule ScreenTest do
  use ExUnit.Case
  alias AOCDay.Screen

  test "can initialize the screen" do
    Application.put_env(:caster, :width, 3)
    Application.put_env(:caster, :height, 2)
    init = Screen.init
    assert Screen.as_string(init) == "...\n..."
  end

  test "works with test data" do
    Application.put_env(:caster, :width, 7)
    Application.put_env(:caster, :height, 3)
    screen = Screen.init
    Screen.update(screen, %{action: "rect", x: 3, y: 2})
    assert Screen.as_string(screen) == "###....\n###....\n......."
    Screen.update(screen, %{action: "column", column: 1, amount: 1})
    assert Screen.as_string(screen) == "#.#....\n###....\n.#....."
    Screen.update(screen, %{action: "row", row: 0, amount: 4})
    assert Screen.as_string(screen) == "....#.#\n###....\n.#....."
    Screen.update(screen, %{action: "column", column: 1, amount: 1})
    assert Screen.as_string(screen) == ".#..#.#\n#.#....\n.#....."
    assert Screen.pixels_lit(screen) == 6
  end
end
