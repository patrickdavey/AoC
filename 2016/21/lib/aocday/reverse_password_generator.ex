defmodule AOCDay.ReversePasswordGenerator do
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
    password = swap_positions(password, p1, p2)
    {:reply, :ok, password}
  end

  def handle_call(<<"swap letter "::utf8, l1::utf8, " with letter "::utf8, l2::utf8>>, _from, password) do
    l1 = <<l1>>
    l2 = <<l2>>
    i1 = Enum.find_index(password, &(&1 == l1))
    i2 = Enum.find_index(password, &(&1 == l2))
    password = swap_positions(password, i1, i2)
    {:reply, :ok, password}
  end

  def handle_call(<<"reverse positions "::utf8, start::utf8, " through "::utf8, finish::utf8>>, _from, password) do
    start = String.to_integer <<start>>
    finish = String.to_integer <<finish>>

    password = Enum.slice(password, start..finish)
            |> Enum.reverse
            |> Enum.zip(start..finish)
            |> Enum.reduce(password, &put_letter_at_position/2)
    {:reply, :ok, password}
  end

  def handle_call(<<"move position "::utf8, p2::utf8, " to position "::utf8, p1::utf8>>,_from, password) do
    p1 = String.to_integer(<<p1>>)
    p2 = String.to_integer(<<p2>>)
    element = Enum.at(password, p1)
    password = List.delete_at(password, p1)

    password = if p1 < p2 do
      List.insert_at(password, p2, element)
    else
      List.insert_at(password, p2, element)
    end
    {:reply, :ok, password}
  end

  def handle_call(<<"rotate based on position of letter "::utf8, letter::utf8>>, _from, password) do
    # cheaty reversal
    letter = <<letter>>
    i1 = Enum.find_index(password, &(&1 == letter))
    cond do
      i1 == 0 ->
        password = rotate_right(password, 7)
      i1 == 1 ->
        password = rotate_left(password, 1)
      i1 == 2 ->
        password = rotate_right(password, 2)
      i1 == 3 ->
        password = rotate_left(password, 2)
      i1 == 4 ->
        password = rotate_right(password, 1)
      i1 == 5 ->
        password = rotate_left(password, 3)
      i1 == 6 ->
        password = password
      i1 == 7 ->
        password = rotate_left(password, 4)
    end

    {:reply, :ok, password}
  end

  def handle_call(<<"rotate right "::utf8, amount::utf8, " steps">>,_from, password) do
    amount = String.to_integer <<amount>>
    {:reply, :ok, rotate_left(password, amount)}
  end

  def handle_call(<<"rotate left "::utf8, amount::utf8, " steps">>,_from, password) do
    amount = String.to_integer <<amount>>
    {:reply, :ok, rotate_right(password, amount)}
  end

  defp swap_positions(password, p1, p2) do
    first = Enum.at(password, p1)
    last = Enum.at(password, p2)
    password
    |> List.replace_at(p1, last)
    |> List.replace_at(p2, first)
  end

  defp put_letter_at_position({letter, index}, password) do
    List.replace_at(password, index, letter)
  end

  defp rotate_right(password, amount) do
    password_len = Enum.count password
    Enum.zip(password, 0..password_len)
                      |> Enum.map(fn({letter, index}) ->
                        {letter, rem(password_len + index + amount, password_len) }
                      end)
                      |> Enum.reduce(password, &put_letter_at_position/2)
  end

  defp rotate_left(password, amount) do
    password_len = Enum.count password
    Enum.zip(password, 0..password_len)
                      |> Enum.map(fn({letter, index}) ->
                        {letter, rem(password_len + index - amount, password_len) }
                      end)
                      |> Enum.reduce(password, &put_letter_at_position/2)
  end
end

