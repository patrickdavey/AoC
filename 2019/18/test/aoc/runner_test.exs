defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser}

  test "first sample runs correctly" do
    first = """
       #########
       #b.A.@.a#
       #########
    """
    assert(Runner.part_1(Parser.parse(first)) == 8)
  end

  test "second sample runs correctly" do
    sample = """
    ########################
    #f.D.E.e.C.b.A.@.a.B.c.#
    ######################.#
    #d.....................#
    ########################
    """
    assert(Runner.part_1(Parser.parse(sample)) == 86)
  end

  test "third sample runs correctly" do
    sample = """
        ########################
        #...............b.C.D.f#
        #.######################
        #.....@.a.B.c.d.A.e.F.g#
        ########################
    """
    assert(Runner.part_1(Parser.parse(sample)) == 132)
  end

  test "fourth sample runs correctly" do
    sample = """
    #################
    #i.G..c...e..H.p#
    ########.########
    #j.A..b...f..D.o#
    ########@########
    #k.E..a...g..B.n#
    ########.########
    #l.F..d...h..C.m#
    #################
    """
    assert(Runner.part_1(Parser.parse(sample)) == 136)
  end

  test "fifth sample runs correctly" do
    sample = """
            ########################
            #@..............ac.GI.b#
            ###d#e#f################
            ###A#B#C################
            ###g#h#i################
            ########################
    """
    assert(Runner.part_1(Parser.parse(sample)) == 81)
  end
end
