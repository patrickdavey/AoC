require 'pry'

signals = IO.readlines('test.txt')

signals.each do |signal|
  case
  when match = signal.match(/^(?<value>\d+) -> (?<wire>\w+)/)
  when match = signal.match(/^(?<first_input>.+) AND (?<second_input>.+) -> (?<wire>\w+)/)
  when match = signal.match(/^(?<first_input>.+) OR (?<second_input>.+) -> (?<wire>\w+)/)
  when match = signal.match(/^(?<first_input>.+) LSHIFT (?<second_input>.+) -> (?<wire>\w+)/)
  when match = signal.match(/^(?<first_input>.+) RSHIFT (?<second_input>.+) -> (?<wire>\w+)/)
  when match = signal.match(/^NOT (?<first_input>.+) -> (?<wire>\w+)/)
  end
end
