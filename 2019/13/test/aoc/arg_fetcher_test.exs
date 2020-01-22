defmodule AOCArgFetcherTest do
  use ExUnit.Case
  alias AOC.{ArgFetcher, Parser}

  test "add sample works" do
    program = Parser.parse("1,0,0,0,99")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:add, { 1, 1, 0 } } = result
  end

  test "add immediate_mode sample works" do
    program = Parser.parse("1101,100,-1,4,0")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:add, { 100, -1, 4 } } = result
  end

  test "day 3 sample 1 works" do
    program = Parser.parse("1,9,10,3,2,3,11,0,99,30,40,50")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:add, { 30, 40, 3 } } = result
  end

  test "day 3 sample 2 works" do
    program = Parser.parse("1,9,10,70,2,3,11,0,99,30,40,50")
    state = %{
      instruction_pointer: 4,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:mult, { 70, 50, 0 } } = result
  end

  test "halt works" do
    program = Parser.parse("1,9,10,70,2,3,11,0,99,30,40,50")
    state = %{
      instruction_pointer: 8,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:terminate, {} } = result
  end

  test "input works" do
    program = Parser.parse("3, 50")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:input, {50} } = result
  end

  test "relative input works" do
    program = Parser.parse("203, 50")
    state = %{
      instruction_pointer: 0,
      relative_base: 2,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:input, {52} } = result
  end

  test "output works" do
    program = Parser.parse("4, 1")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:output, {1} } = result
  end

  test "jump_if_true" do
    program = Parser.parse("5, 1, 0")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:jump_if_true, {1, 5} } = result
  end

  test "relative base works" do
    program = Parser.parse("109,19")
    state = %{
      instruction_pointer: 0,
      relative_base: 0,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:relative_base, { 19 } } = result
  end

  test "relative base works using relative" do
    program = Parser.parse("209,2,0,999")
    state = %{
      instruction_pointer: 0,
      relative_base: 1,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:relative_base, { 999 } } = result
  end

  test "mult works using relative and immediate" do
    program = Parser.parse("22202,2,2,2,999")
    state = %{
      instruction_pointer: 0,
      relative_base: 2,
      program: program
    }
    result = ArgFetcher.fetch(state)

    assert {:mult, { 999, 999, 4 } } = result
  end
end
