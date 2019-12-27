defmodule CalculatorTest do
  use ExUnit.Case
  alias AOC.Calculator

  test "calculates the test inputs correctly" do
    assert(Calculator.calculate(12) == 2)
    assert(Calculator.calculate(14) == 2)
    assert(Calculator.calculate(1969) == 654)
    assert(Calculator.calculate(100756) == 33583)
  end
end
