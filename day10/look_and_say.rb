require 'pry'

class LookAndSay
  def initialize(init)
    @value = init.to_s
  end

  def after(times)
    times.times do
      n = ''
      counter = 1
      for i in 0..value.size - 1
        digit = value[i]
        if value[i + 1] == digit
          counter += 1
        else
          n << counter.to_s
          n << digit
          counter = 1
        end
      end
      @value = n
    end
    value
  end


  private

  attr_reader :value
end
