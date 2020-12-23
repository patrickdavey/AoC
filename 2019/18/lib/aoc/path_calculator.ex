defmodule AOC.PathCalculator do
  alias AOC.{Board, CombinePermute, FindPath}

  def find_all(start, board) do
    combinations(start, board)
    |> Enum.reduce({%{}, board}, &compute_each_path/2)
    |> elem(0)
  end


  defp combinations(start, board) do
    results = board
    |> Enum.filter(fn({k, v}) -> !is_atom(v) && String.match?(v, ~r/[a-z]/)end)
    |> Enum.map(fn({k, v}) -> k end)
    |> Kernel.++([start])

    CombinePermute.comb(2, results)
  end

  defp compute_each_path([start, finish], { acc, board }) do
    { distance, doors } = FindPath.between(start, finish, board)
    acc = Map.put(acc, { start, finish }, { distance, doors })
    acc = Map.put(acc, { finish, start }, { distance, doors })
    { acc, board }
  end
end
