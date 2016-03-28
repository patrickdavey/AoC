require 'pry'

class Logic
  def self.build(signal)
    case
    when match = signal.match(/^(?<value>\d+) -> (?<wire>\w+)/)
      ValueLogic.new(match[:value], match[:wire])
    when match = signal.match(/^(?<first_input>.+) AND (?<second_input>.+) -> (?<wire>\w+)/)
      AndLogic.new(match[:first_input], match[:second_input], match[:wire])
    when match = signal.match(/^(?<first_input>.+) OR (?<second_input>.+) -> (?<wire>\w+)/)
      OrLogic.new(match[:first_input], match[:second_input], match[:wire])
    when match = signal.match(/^(?<first_input>.+) LSHIFT (?<second_input>.+) -> (?<wire>\w+)/)
      LShiftLogic.new(match[:first_input], match[:second_input], match[:wire])
    when match = signal.match(/^(?<first_input>.+) RSHIFT (?<second_input>.+) -> (?<wire>\w+)/)
      RShiftLogic.new(match[:first_input], match[:second_input], match[:wire])
    when match = signal.match(/^NOT (?<first_input>.+) -> (?<wire>\w+)/)
      NotLogic.new(match[:first_input], match[:wire])
    end
  end
end

require "./value_logic.rb"
require "./and_logic.rb"
require "./or_logic.rb"
require "./lshift_logic.rb"
require "./rshift_logic.rb"
require "./not_logic.rb"
