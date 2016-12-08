defmodule ScreenTest do
  use ExUnit.Case
  alias AOCDay.Screen

  test "can initialize the screen" do
    init = Screen.init(3, 2)
    assert Screen.as_string(init) == "...\n..."
  end

  test "can draw a rectangle" do
    screen = Screen.init(7,3)
    new_screen = Screen.update(screen, %{action: "rect", x: 3, y: 2})
  end
end
