defmodule RegisterTest do
  use ExUnit.Case
  alias AOCDay.Register

  test "bots test register works" do
    Register.start_link(:a)

    assert 2 == GenServer.call(:a, {:cpy, 41, 1})
    assert GenServer.call(:a, { :current_value }) == 41

    assert 3 == GenServer.call(:a, {:inc, 2})
    assert GenServer.call(:a, { :current_value }) == 42

    assert 4 == GenServer.call(:a, {:dec, 3})
    assert GenServer.call(:a, { :current_value }) == 41

    Register.start_link(:b)
    assert 5 == GenServer.call(:b, {:cpy, :a, 4})
    assert GenServer.call(:b, { :current_value }) == 41

    assert 10 == GenServer.call(:a, {:jnz, 6, 4})

    GenServer.call(:a, {:cpy, 0, 4})
    assert 5 == GenServer.call(:a, {:jnz, 6, 4})
  end
end
