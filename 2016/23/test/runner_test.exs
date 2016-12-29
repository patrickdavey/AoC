defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner
  alias AOCDay.Parser

  test "bots test register works" do
    instructions = Parser.parse(" cpy 41 a
inc a
inc a
dec a
jnz a 2
dec a ")
    registers = %{"a" => 0, "b" => 0, "c" => 0, "d" => 0}

    new_reg = Runner.run(instructions, 0, registers)
    assert new_reg["a"] == 42
  end

  test "jump instruction works" do
    instructions = Parser.parse(" cpy 2 a
      tgl a
      tgl a
      tgl a
      cpy 1 a
      dec a
      dec a")
    registers = %{"a" => 0, "b" => 0, "c" => 0, "d" => 0}

    new_reg = Runner.run(instructions, 0, registers)
    assert new_reg["a"] == 3
  end
end
