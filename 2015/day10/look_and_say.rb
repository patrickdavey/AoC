require 'pry'

class LookAndSay
  def initialize(init)
    @value = init.to_s
  end

  def after(times)
    times.times do
      n = ''
      counter = 1
      index = 0
      while (digit = value[index])
        if value[index + 1] == digit
          counter += 1
        else
          n << counter.to_s
          n << digit
          counter = 1
        end
        index += 1
      end
      @value = n
    end
    value
  end


  private

  attr_reader :value
end
