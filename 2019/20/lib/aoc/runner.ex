defmodule AOC.Runner do
  alias AOC.{Board, AvailableGenerator}
  def part_2(state \\ structured_data) do
    { x, y } = state.start
    { fx, fy } = state.finish
    starting = { x, y, 0}
    finish = { fx, fy, 0}
    bfs([{starting, 0}], state.board, state.portals, finish, %{})
  end

  defp bfs([{pos, dist}|t], board, portals, finish, visited) do
    cond do
      pos == finish ->
        dist + 1
      true ->
        visited = Map.put(visited, pos, true)
        t ++ AvailableGenerator.from(board, pos, portals, dist, visited)
        |> bfs(board, portals, finish, visited)
    end
  end

  defp bfs([], board, portals, finish, visited) do
    require IEx
    IEx.pry
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
