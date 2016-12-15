defmodule AOCDay.Runner do
  def find_time(starting_time \\ 0) do
    disks = Enum.map(Application.get_env(:aoc, :start_disks), fn(disk = %{positions: positions, position: position}) ->
        %{disk | position: rem(position + starting_time, positions)}
    end)

    check(disks, starting_time, _level = 0,  Application.get_env(:aoc, :final_position))
  end

  defp check(_disks, time, out, out ), do: time

  defp check(disks, time, level, out) do
    disks = updated_disks(disks)

    cond do
      Enum.at(disks, level).position == 0 -> check(disks, time, level + 1, out)
      :otherwise -> find_time(time + 1)
    end
  end

  def updated_disks(disks) do
    Enum.map(disks, fn(disk = %{positions: positions, position: position}) ->
        %{disk | position: rem(position + 1, positions)}
    end)
  end
end
