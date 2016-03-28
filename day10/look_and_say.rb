require 'pry'

class LookAndSay
  def initialize(init)
    @value = init.to_s
  end

  def after(times)
    times.times do
      @value.gsub!(/(.)\1*/) do |match|
        "#{match.length}#{match.slice(0)}"
      end
    end
    value
  end


  private

  attr_reader :value
end
