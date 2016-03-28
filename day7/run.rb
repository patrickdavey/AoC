require 'pry'
require "./signal_finder.rb"

sf = SignalFinder.new(IO.readlines("input.txt"))
puts sf.signal_on("a")
