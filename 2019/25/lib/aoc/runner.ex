defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Board, CombinePermute, Scaffold}
  @options ["easter egg",
    "sand",
    "fixed point",
    "coin",
    "spool of cat6",
    "shell",
    "hypercube",
    "asterisk"]

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(intcode, :intcode)
    send(intcode, {:set_initial, self(), program})
    send(intcode, :run)
    pre_inst = [
      "east\n",
      "take asterisk\n",
      # "east\n" # don't go east,
      "west\n",
      "west\n",
      "take fixed point\n",
      "north\n",
      "take sand\n",
      "south\n",
      "east\n", # at hull breach
      "south\n", # at sick bay
      "north\n", # hull breach
      "east\n", # observatory
      "north\n", # (N, S, W available) arcade (don't take electromagnet)
      "north\n", # Passages
      "take hypercube\n",
      "north\n", # Storage
      "take coin\n",
      "north\n", # Navigation
      "take easter egg\n",
      "south\n", # storage
      "south\n", # passages
      "south\n", # arcade
      "west\n", # crew quarters ("N,E,S") S is bad E leads to arcade
      "north\n", # corridor
      "take spool of cat6\n",
      "north\n", # kitchen
      "take shell\n",  #west to checkpoint
      "south\n", # corridor
      "south\n", # crew quarters
      "south\n", # engineering, dead end, do not take lava
      "north\n", # crew quarters
      "north\n", # corridor
      "north\n", # kitchen
      "west\n", # checkpoint
      "north\n", # test checkpoint
    ]

    all_inst = gen_perms(pre_inst) |> List.flatten

    wait_loop(%{letters: [], pre_inst: all_inst}, intcode)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(acc, intcode) do
    receive do
      {:terminating, ^intcode} ->
        Map.fetch!(acc, :letters) |> IO.puts
      {:input, value, ^intcode} ->
        Map.update!(acc, :letters, fn(a) ->
          a ++ [value]
        end)
        |> print_or_execute
        |> wait_loop(intcode)
    end
  end

  defp send_intcode(string) do
    string
    |> String.to_charlist
    |> Enum.each(fn(i) ->
      send(:intcode, {:input, i })
    end)
  end

  defp print_or_execute(acc) do
    s = Map.fetch!(acc, :letters) |> to_string
    cond do
      String.ends_with?(s, "Command?") ->
        IO.puts(s)
        letters = get_or_use(Map.fetch!(acc, :pre_inst))
        Map.put(acc, :pre_inst, letters)
      true ->
        acc
    end
  end

  def get_or_use([h | t]) do
    send_intcode(h)
    t
  end

  def get_or_use(_) do
    send_intcode(IO.gets("give command:\n"))
  end

  def gen_perms(starting) do
    drop_all = Enum.map(@options, &("drop #{&1}\n"))
    foo = CombinePermute.comb(4, @options)
    |> Enum.map(fn(items) ->
      Enum.map(items, &("take #{&1}\n"))
    end)
    |> Enum.map(fn(items) ->
      drop_all ++ items ++ ["north\n", "north\n"]
    end)
    starting ++ foo
  end
end
