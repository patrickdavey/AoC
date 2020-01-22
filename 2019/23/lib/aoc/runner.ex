defmodule AOC.Runner do
  alias AOC.{IntcodeAgent}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)

    intcodes = Enum.map(0..49, fn(nic) ->
      intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
      send(intcode, {:set_initial, supervisor_pid, program})
      send(intcode, {:input, nic })
      send(intcode, :run)
      { nic, { intcode, []}}
    end)
    |> Enum.into(%{ :store => {nil, []}, 255 => {nil, []}})

    idles = Enum.map(0..49, fn(nic) ->
      {pid, _list} = Map.fetch!(intcodes, nic)
      { pid, false }
    end) |> Enum.into(%{})

    wait_loop(intcodes, idles)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(intcodes, idles) do
    if should_send?(intcodes, idles) do
      { nil, list } = Map.get(intcodes, :store)
      { nil, [255, x, y] } = Map.get(intcodes, 255)

      new_list = (list ++ [y]) |> Enum.take(-2)

      check_same(new_list)
      intcodes = Map.replace!(intcodes, :store, { nil, new_list})
      { pid, _list } = Map.get(intcodes, 0)

      send(pid, {:input, x })
      send(pid, {:input, y })
      idles = Map.replace!(idles, pid, false)
      wait_loop(intcodes, idles)
    else
      receive do
        {:terminating, intcode} ->
          require IEx
          IEx.pry
        {:input, value, intcode} ->
          process(intcodes, intcode, value, idles)
          |> wait_loop(idles)
        {:idle, intcode} ->
          idles = Map.replace!(idles, intcode, true)
          wait_loop(intcodes, idles)
        {:clear_idle, pid} ->
          idles = Map.replace!(idles, pid, false)
          wait_loop(intcodes, idles)
      end
    end
  end

  defp process(intcodes, intcode, value, idles) do
    { nic, { pid, list }} = Enum.find(intcodes, fn({k, {pid, list}}) -> pid == intcode end)
    list = list ++ [value]
    { intcodes, after_message_list } = message_list(intcodes, list, idles)

    Map.replace(intcodes, nic, { pid, after_message_list })
  end

  defp message_list(intcodes, list = [nic, _x, _y], idles) when nic == 255 do
    intcodes = Map.replace!(intcodes, 255, { nil, list |> Enum.take(-3)})

    { intcodes, [] }
  end

  defp message_list(intcodes, [nic, x, y], _idles) do
    { pid, _list } = Map.get(intcodes, nic)
    send(pid, {:input, x })
    send(pid, {:input, y })
    send(self(), {:clear_idle, pid})
    {intcodes, []}
  end

  defp message_list(intcodes, list, idles) do
    [h | t ] = list
    cond do
      h < 50 ->
        { pid, _list } = Map.fetch!(intcodes, h)
        send(self(), {:clear_idle, pid})
      true -> nil
    end

    { intcodes, list }
  end

  defp check_same([a, a]) do
    IO.puts "THIS IS IT: #{a}"
  end

  defp check_same([a, b]) do
    IO.puts "Trying: #{a}, #{b}"
  end

  defp check_same(x) do
  end

  defp should_send?(intcodes, idles) do
    is_idle = idles |> Map.values |> Enum.all?(&(&1))
    { nil, nat } = Map.fetch!(intcodes, 255)

    is_idle && (nat |> length) >= 3
  end
end
