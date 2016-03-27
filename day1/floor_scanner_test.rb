require "minitest/autorun"
require "./floor_scanner.rb"
require "pry"

class FloorScannerTest < Minitest::Test
  def test_sample_floors
    scanner = FloorScanner.new(")")
    assert_equal(scanner.enters_basement_at, 1)
    scanner = FloorScanner.new("()())")
    assert_equal(scanner.enters_basement_at, 5)
  end
end
