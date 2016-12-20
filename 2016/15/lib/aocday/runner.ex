defmodule AOCDay.Runner do
  def find_time_alignment(disks, time) do
    puts "attempting #{time}"
    if disks_aligned?(disks, time, _level = 0,  Application.get_env(:aoc, :final_position)) do
      time
    else
      find_time_alignment(disks, time + 1)
    end
  end

  defp disks_aligned?(_disks, _time, out, out ), do: true
  defp disks_aligned?(disks, time, level, out) do
    cond do
      Enum.at(disks, level).position == 0 -> disks_aligned?(disks, time + 1, level + 1, out)
      :otherwise -> false
    end
  end

  def updated_disks(disks) do
    Enum.map(disks, fn(disk = %{positions: positions, position: position}) ->
        %{disk | position: rem(position + 1, positions)}
    end)
  end
end
