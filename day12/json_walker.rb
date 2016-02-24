require 'json'
require 'pry'

class JsonWalker
  def initialize(json_string)
    @json = JSON.parse(json_string)
  end

  def sum(traverse = json, acc = 0)
    if (traverse.respond_to?(:each))
      return acc + sum(traverse.pop) + sum(traverse)
    elsif traverse.kind_of?(Numeric)
      return acc + traverse
    else
      return acc + 0
    end
  end


  private

  attr_reader :json
end
