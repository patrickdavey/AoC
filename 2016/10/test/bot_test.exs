defmodule BotTest do
  use ExUnit.Case
  alias AOCDay.Bot
  test "bots state updated correctly" do
    {:ok, bot} = Bot.init
    assert Bot.get(bot) == %{low: nil, high: nil, low_dest: nil, high_dest: nil}
    Bot.receive_value(bot, 10)
    assert Bot.get(bot) == %{low: 10, high: nil, low_dest: nil, high_dest: nil}
    Bot.receive_value(bot, 12)
    assert Bot.get(bot) == %{low: 10, high: 12, low_dest: nil, high_dest: nil}

    {:ok, bot} = Bot.init
    assert Bot.get(bot) == %{low: nil, high: nil, low_dest: nil, high_dest: nil}
    Bot.receive_value(bot, 10)
    assert Bot.get(bot) == %{low: 10, high: nil, low_dest: nil, high_dest: nil}
    Bot.receive_value(bot, 8)
    assert Bot.get(bot) == %{low: 8, high: 10, low_dest: nil, high_dest: nil}

    {:ok, bot} = Bot.init
    Bot.receive_value(bot, 8)
    Bot.receive_value(bot, 10)
    assert Bot.get(bot) == %{low: 8, high: 10, low_dest: nil, high_dest: nil}

    {:ok, bot} = Bot.init
    Bot.receive_value(bot, 10)
    Bot.receive_value(bot, 10)
    assert Bot.get(bot) == %{low: 10, high: 10, low_dest: nil, high_dest: nil}
  end
end
