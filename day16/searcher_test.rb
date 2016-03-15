require "minitest/autorun"
require "./searcher.rb"

class SearcherTest < Minitest::Test
  def test_finds_simple_search
    searcher = Searcher.new({
      children: 3,
      cats: 10,
      samoyeds: 2,
      pomeranians: 3,
      akitas: 0,
      vizslas: 2,
      goldfish: 5,
      trees: 3,
      cars: 2,
      perfumes: 1
    })

    a1 = Sue.new("Sue1")
    a1.cats = 10
    a1.vizslas = 1
    searcher << a1

    a2 = Sue.new("Sue2")
    a2.cats = 10
    a2.vizslas = 2
    searcher << a2

    assert_equal searcher.find_matching_sue!, "Sue2"
  end
end
