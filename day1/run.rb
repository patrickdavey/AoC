require "./floor_scanner"

scanner = FloorScanner.new(IO.read("./input.txt"))
puts scanner.enters_basement_at
