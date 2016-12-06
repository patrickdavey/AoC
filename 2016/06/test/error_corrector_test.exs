defmodule ErrorCorrectorTest do
  use ExUnit.Case
  alias AOCDay.ErrorCorrector

  test "finds code correctly" do
    Application.put_env(AOCDay, :min_max, :max_by)
    assert ErrorCorrector.message(test_input) == "easter"
  end

  test "finds mincode correctly" do
    Application.put_env(AOCDay, :min_max, :min_by)
    assert ErrorCorrector.message(test_input) == "advent"
  end

  defp test_input do
"eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar"

  end
end
