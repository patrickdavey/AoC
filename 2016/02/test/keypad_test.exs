defmodule KeypadTest do
  use ExUnit.Case
  alias AOCDay.Keypad

  test "calulates next positions for 1 correctly" do
    assert Keypad.next("1", "U") == "1"
    assert Keypad.next("1", "D") == "4"
    assert Keypad.next("1", "L") == "1"
    assert Keypad.next("1", "R") == "2"
  end

  test "calulates next positions for 2 correctly" do
    assert Keypad.next("2", "U") == "2"
    assert Keypad.next("2", "D") == "5"
    assert Keypad.next("2", "L") == "1"
    assert Keypad.next("2", "R") == "3"
  end

  test "calulates next positions for 3 correctly" do
    assert Keypad.next("3", "U") == "3"
    assert Keypad.next("3", "D") == "6"
    assert Keypad.next("3", "L") == "2"
    assert Keypad.next("3", "R") == "3"
  end

  test "calulates next positions for 4 correctly" do
    assert Keypad.next("4", "U") == "1"
    assert Keypad.next("4", "D") == "7"
    assert Keypad.next("4", "L") == "4"
    assert Keypad.next("4", "R") == "5"
  end

  test "calulates next positions for 5 correctly" do
    assert Keypad.next("5", "U") == "2"
    assert Keypad.next("5", "D") == "8"
    assert Keypad.next("5", "L") == "4"
    assert Keypad.next("5", "R") == "6"
  end

  test "calulates next positions for 6 correctly" do
    assert Keypad.next("6", "U") == "3"
    assert Keypad.next("6", "D") == "9"
    assert Keypad.next("6", "L") == "5"
    assert Keypad.next("6", "R") == "6"
  end

  test "calulates next positions for 7 correctly" do
    assert Keypad.next("7", "U") == "4"
    assert Keypad.next("7", "D") == "7"
    assert Keypad.next("7", "L") == "7"
    assert Keypad.next("7", "R") == "8"
  end

  test "calulates next positions for 8 correctly" do
    assert Keypad.next("8", "U") == "5"
    assert Keypad.next("8", "D") == "8"
    assert Keypad.next("8", "L") == "7"
    assert Keypad.next("8", "R") == "9"
  end

  test "calulates next positions for 9 correctly" do
    assert Keypad.next("9", "U") == "6"
    assert Keypad.next("9", "D") == "9"
    assert Keypad.next("9", "L") == "8"
    assert Keypad.next("9", "R") == "9"
  end
end
