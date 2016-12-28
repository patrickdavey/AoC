defmodule ParseTest do
  use ExUnit.Case
  alias AOCDay.Parser

  test "cpy import works" do
    instruction = Parser.parse(" cpy 1 b ")
    assert instruction == [b: {:cpy, 1}]

    instruction = Parser.parse(" cpy a b ")
    assert instruction == [b: {:cpy, :a}]
  end

  test "jump instruction works" do
    instruction = Parser.parse(" jnz c 2 ")
    assert instruction == [c: {:jnz, 2}]

    instruction = Parser.parse(" jnz c -2 ")
    assert instruction == [c: {:jnz, -2}]

    instruction = Parser.parse(" jnz c -2 ")
    assert instruction == [c: {:jnz, -2}]

    instruction = Parser.parse(" jnz 1 5 ")
    assert instruction == [always_on: {:jnz, 5}]
  end

  test "inc instruction works" do
    instruction = Parser.parse(" inc c ")
    assert instruction == [c: {:inc}]
  end

  test "dec instruction works" do
    instruction = Parser.parse(" dec c ")
    assert instruction == [c: {:dec}]
  end
end
