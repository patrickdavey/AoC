require 'json'
require 'pry'

class JsonWalker
  def initialize(json_string)
    @json = JSON.parse(json_string)
  end

  def sum(iterate_over = json, accumulator = [])
    t = iterate_over.each_with_object(accumulator) do |(k,v), accum|
      accum << k if k.is_a?(Numeric)
      accum << v if v.is_a?(Numeric)
      sum(v, accum) if v.respond_to?(:each)
      sum(k, accum) if k.respond_to?(:each)
    end
    t.reduce(&:+)
  end


  private

  attr_reader :json
end
