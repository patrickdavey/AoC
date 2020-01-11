defmodule AOC.Orbiter do
  def calculate(system) do
    find_orbits(%{}, system, [{"COM", 0, ["COM"]}])
  end

  def find_orbits(distances, system, []) do
    distances
  end

  def find_orbits(distances, system, [{current, distance, path} | t]) do
    distances = Map.put(distances, current, {distance, path})

    remaining = system
    |> Map.get(current, [])
    |> Enum.reduce(t, &([{ &1, distance + 1, [&1 | path] } | &2]))

    find_orbits(distances, system, remaining)
  end
end
