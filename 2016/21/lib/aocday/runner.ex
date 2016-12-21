defmodule AOCDay.Runner do
  alias AOCDay.PasswordGenerator

  def part_1 do
    PasswordGenerator.start_link("abcdefgh", :generator)
    Enum.each(structured_data, fn(i) -> 
      before = GenServer.call(:generator, :current_password)
      GenServer.call(:generator, i)
      p2 = GenServer.call(:generator, :current_password)
      IO.puts "#{i} -> [#{before}] -> [#{p2}]"
    end)
  

    GenServer.call(:generator, :current_password)
    |> IO.puts
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end
end
