defmodule CalculatorTest do
  use ExUnit.Case
  alias AOC.Calculator

  test "basic calculates the test inputs correctly" do
    assert(Calculator.calculate(12) == 2)
    assert(Calculator.calculate(14) == 2)
    assert(Calculator.calculate(1969) == 654)
    assert(Calculator.calculate(100756) == 33583)
  end

  test "day 2 calculates the test inputs correctly" do
    assert(Calculator.full_calculate(14) == 2)
    assert(Calculator.full_calculate(1969) == 966)
    assert(Calculator.full_calculate(100756) == 50346)
  end
end
