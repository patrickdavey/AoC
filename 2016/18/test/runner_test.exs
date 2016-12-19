defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "" do
    assert Runner.safe_tiles_for(".^^.^.^^^^", 10) == 38
  end
end
