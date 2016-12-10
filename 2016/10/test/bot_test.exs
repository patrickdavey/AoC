defmodule BotTest do
  use ExUnit.Case
  alias AOCDay.Bot
  alias AOCDay.Dest
  test "bots state updated correctly" do
    {:ok, bot} = Bot.init
    assert Bot.get(bot) == %{low: nil, high: nil, low_dest: nil, high_dest: nil}
    Bot.set_value(bot, 10)
    assert Bot.get(bot) == %{low: 10, high: nil, low_dest: nil, high_dest: nil}
    Bot.set_value(bot, 12)
    assert Bot.get(bot) == %{low: 10, high: 12, low_dest: nil, high_dest: nil}

    {:ok, bot} = Bot.init
    assert Bot.get(bot) == %{low: nil, high: nil, low_dest: nil, high_dest: nil}
    Bot.set_value(bot, 10)
    assert Bot.get(bot) == %{low: 10, high: nil, low_dest: nil, high_dest: nil}
    Bot.set_value(bot, 8)
    assert Bot.get(bot) == %{low: 8, high: 10, low_dest: nil, high_dest: nil}

    {:ok, bot} = Bot.init
    Bot.set_value(bot, 8)
    Bot.set_value(bot, 10)
    assert Bot.get(bot) == %{low: 8, high: 10, low_dest: nil, high_dest: nil}

    {:ok, bot} = Bot.init
    Bot.set_value(bot, 10)
    Bot.set_value(bot, 10)
    assert Bot.get(bot) == %{low: 10, high: 10, low_dest: nil, high_dest: nil}
  end

  test "bots gives can be updated" do
    {:ok, bot} = Bot.init
    Bot.set_dest_info(bot, %{low_dest: %Dest{type: "bot", index: 1}, high_dest: %Dest{type: "bot", index: 0}})
    assert %{low_dest: %Dest{type: "bot", index: 1}, high_dest: %Dest{type: "bot", index: 0}} = Bot.get(bot)

  end
end
