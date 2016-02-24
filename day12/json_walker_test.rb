=begin
--- Day 12: JSAbacusFramework.io ---

Santa's Accounting-Elves need help balancing the books after a recent order. Unfortunately, their accounting software uses a peculiar storage format. That's where you come in.

They have a JSON document which contains a variety of things: arrays ([1,2,3]), objects ({"a":1, "b":2}), numbers, and strings. Your first job is to simply find all of the numbers throughout the document and add them together.

For example:

    [1,2,3] and {"a":2,"b":4} both have a sum of 6.
    [[[3]]] and {"a":{"b":4},"c":-1} both have a sum of 3.
    {"a":[-1,1]} and [-1,{"a":1}] both have a sum of 0.
    [] and {} both have a sum of 0.

You will not encounter any strings containing numbers.

What is the sum of all numbers in the document?
=end
require "minitest/autorun"
require "./json_walker.rb"
class JsonWalkerTest < Minitest::Test

  def test_known_good_examples
    sample_data = [
      ["[1,2,3]", 6],
      ['{"a":2,"b":4}', 6],
      ['[[[3]]]',3],
      ['{"a":{"b":4},"c":-1}',3],
      ['{"a":[-1,1]}',0],
      ['{"a":[-1,{"a": 1}]}',0],
      ['[-1,{"a":1}]',0],
      ['{"a":[-1,{"a": [[1,2,3]]}]}',5],
      ['[1,{"c":"red","b":2},3]', 4]
    ]

    sample_data.each do |(json, sum)|
      10.times { puts }
      assert_equal sum, JsonWalker.new(json).sum, "#{sum} not the sum of #{json}"
    end
  end
end
