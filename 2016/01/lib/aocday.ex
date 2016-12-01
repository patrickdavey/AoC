defmodule AOCDay do
  def run do
    AOCDay.Map.start_link
    AOCDay.Runner.run
  end
end
