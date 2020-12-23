defmodule AOC.Donut do
  defstruct [:start, :finish, :portals, :board]
  @enforce_keys [:start, :finish, :portals, :board]
end
