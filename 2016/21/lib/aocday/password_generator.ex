defmodule AOCDay.PasswordGenerator do
  use GenServer

  def start_link(initial, name) do
    GenServer.start_link(__MODULE__, initial, [name: name, timeout: 100000])
  end

  ## Server Callbacks

  def init(initial) do
    {:ok, String.graphemes(initial) }
  end

  def handle_call(:current_password, _from, password) do
    {:reply, password |> Enum.join, password}
  end

  def handle_call(<<"swap position "::utf8, p1::utf8, " with position "::utf8, p2::utf8>>, _from, password) do
    p1 = String.to_integer(<<p1>>)
    p2 = String.to_integer(<<p2>>)
    first = Enum.at(password, p1)
    last = Enum.at(password, p2)
    password = password
    |> List.replace_at(p1, last)
    |> List.replace_at(p2, first)

    {:reply, password, password}
  end
end

