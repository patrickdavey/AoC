defmodule RegisterTest do
  use ExUnit.Case
  alias AOCDay.Register

  test "bots test register works" do
    Register.start_link(:a)
    instructions = [
      {:cpy, 41, :a},
      {:inc, :a},
      {:inc, :a},
      {:dec, :a},
      {:jnz, :a, 2},
      {:dec, :a},
    ]

    GenServer.call(:a, {:cpy, 41})
    assert GenServer.call(:a, { :current_value }) == 41

    GenServer.call(:a, {:inc})
    assert GenServer.call(:a, { :current_value }) == 42

    GenServer.call(:a, {:inc})
    assert GenServer.call(:a, { :current_value }) == 43

    GenServer.call(:a, {:dec})
    assert GenServer.call(:a, { :current_value }) == 42

    Register.start_link(:b)
    GenServer.call(:b, {:cpy, :a})
    assert GenServer.call(:b, { :current_value }) == 42
  end
end
