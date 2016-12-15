defmodule AOCDay.Runner do
  def find_time(disks, starting_time) do
    visited = MapSet.new

    disks = Enum.map(disks, fn(disk = %{positions: positions, position: position}) ->
        %{disk | position: rem(position + starting_time, positions)}
    end)

    check(disks, starting_time, level = 0, out = 2)
  end

  defp check(disks, time, level, level ) do
    IO.puts "time #{time} worked"
    time
  end

  defp check(disks, time, level, out) do
    disks = updated_disks(disks)

    cond do
      Enum.at(disks, level).position == 0 -> check(disks, time, level + 1, out)
      :otherwise ->
        raise "fail"
        #fail
    end
  end

  def updated_disks(disks) do
    Enum.map(disks, fn(disk = %{positions: positions, position: position}) ->
        %{disk | position: rem(position + 1, positions)}
    end)
  end
end

# 1  procedure DFS(G,v):
# 2      label v as discovered
# 3      for all edges from v to w in G.adjacentEdges(v) do
# 4          if vertex w is not labeled as discovered then
# 5              recursively call DFS(G,w)
