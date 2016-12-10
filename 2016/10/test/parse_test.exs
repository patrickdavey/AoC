defmodule ParserTest do
  use ExUnit.Case
  alias AOCDay.Parser
  alias AOCDay.Runner

  test "can parse test column correctly" do
    {max, instructions} = Parser.parse(test_data)
    assert max == 2
  end

  test "can find test answer" do
    {max, instructions} = Parser.parse(test_data)
    Runner.init(max)
    Runner.run_instructions(instructions)
    assert(Runner.bot_with(2, 5)) == 2
  end

  defp test_data do
    """
      value 5 goes to bot 2
      bot 2 gives low to bot 1 and high to bot 0
      value 3 goes to bot 1
      bot 1 gives low to output 1 and high to bot 0
      bot 0 gives low to output 2 and high to output 0
      value 2 goes to bot 2
    """
  end
end
