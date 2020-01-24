defmodule AOC.Reaction do
  @enforce_keys [:quantity, :dependencies]
  defstruct [:quantity, :dependencies]
end
