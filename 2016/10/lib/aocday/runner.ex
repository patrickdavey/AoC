defmodule AOCDay.Runner do
  alias AOCDay.Bot

  def init(number_bots) do
    __MODULE__.start_link(number_bots)
  end

  def start_link(number_bots) do
    Agent.start_link(fn ->
      Enum.reduce((0..number_bots), %{}, fn(index, acc) ->
        {:ok, bot} = Bot.init
        Map.put(acc, index, bot)
      end)
    end, name: __MODULE__)
  end

  def bots do
    Agent.get(__MODULE__, fn bots -> bots end)
  end

  def part_1 do
    {max, instructions} = structured_data
    init(max)
    run_instructions(instructions)

    bot_with(17, 61)
    |> elem(0)
    |> IO.puts
  end

  def part_2 do
    "part 2"
  end

  def run_instructions(instructions) do
    instructions
    |> Enum.each(&send_instruction/1)
  end

  def instruction_in({bot, "bot", value}) do
    Bot.set_value(bots[bot], value)
  end

  def bot_with(low, high) do
    Enum.find(bots, fn({_, bot_pid}) ->
      bot = Bot.get(bot_pid)
      bot.low == low && bot.high == high
    end)
  end

  def instruction_in({bot, "output", value}), do: false

  def send_instruction(%{bot: bot, value: value}) do
    Bot.set_value(bots[bot], value)
  end

  def send_instruction(values = %{bot: bot, high_dest: high_dest, low_dest: low_dest}) do
    Bot.set_dest_info(bots[bot], values)
  end

  defp structured_data do
    AOCDay.Parser.parse
  end
end
