defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner
  alias AOCDay.Parser
  alias AOCDay.Register

  test "bots test register works" do
    Register.start_link(:a)
    Register.start_link(:b)
    Register.start_link(:c)
    Register.start_link(:d)
    instructions = Parser.parse(" cpy 41 a
inc a
inc a
dec a
jnz a 2
dec a ")
    Runner.run_instruction(instructions, Enum.at(instructions, 0), 0)
    assert GenServer.call(:a, {:current_value}) == 42
  end
end
