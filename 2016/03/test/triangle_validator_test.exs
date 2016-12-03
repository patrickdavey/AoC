defmodule TriangleValidatorTest do
  use ExUnit.Case
  alias AOCDay.TriangleValidator

  test "validates triangle sides correctly" do
    refute TriangleValidator.valid?([25, 5, 10])
  end
end
