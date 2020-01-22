defmodule AOCAvailableGeneratorTest do
  use ExUnit.Case
  alias AOC.{Parser, AvailableGenerator}

  test "starting point" do
    positions = AvailableGenerator.from(sample_board, { 15, 34 }, sample_portals, 1, %{
      {15, 34, 0} => true
    }, 0)
    assert(positions == [{15, 33, 0}])
  end

  test "after starting point" do
    positions = AvailableGenerator.from(sample_board, { 15, 33 }, sample_portals, 1, %{
      {15, 34, 0} => true,
      {15, 33, 0} => true
    }, 0)
    assert(positions == [{14, 33, 0}])
  end

  test "outer level outer portal" do
    positions = AvailableGenerator.from(sample_board, { 17, 33 }, sample_portals, 1, %{
      {17, 32, 0} => true,
    }, 0)
    assert(positions == [])
  end

  test "outer level inner portal" do
    positions = AvailableGenerator.from(sample_board, { 17, 29 }, sample_portals, 1, %{
      {16, 29, 0} => true,
    }, 0)
    assert(positions == [{2, 21, -1}])
  end

  def sample_board do
    File.read!("test/fixtures/encoded_board.txt") |> :erlang.binary_to_term
  end

  def sample_portals do
    File.read!("test/fixtures/encoded_portals.txt") |> :erlang.binary_to_term
  end
end
