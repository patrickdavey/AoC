require 'json'
require 'pry'

class JsonWalker
  def initialize(json_string)
    @json = JSON.parse(json_string)
  end

  def sum(iterate_over = json, accumulator = [])
    iterate_over.each_with_object(accumulator) do |k, accumulator|
      if k.is_a?(Hash) && k.has_value?("red")

      elsif k.respond_to?(:each)
        sum(k, accumulator)
      elsif k.is_a?(Numeric)
        accumulator << k
      end
    end.reduce(&:+)
  end


  private

  attr_reader :json
end
