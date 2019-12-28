defmodule AOC.Trace do
  defstruct [:trace_id, :dir, :length]
  @enforce_keys [:dir, :length]
end
