require "pry"
require "./logic"

class SignalFinder
  def initialize(logic_strings)
    @logics = logic_strings.map do |logic|
      Logic.build(logic.strip)
    end
  end

  def signal_on(wire)
    #ick, should be a tree
    resolve_all_signals!
    wire_required = @logics.find { |l| l.wire == wire }
    return wire_required.value
  end


  private

  def resolve_all_signals!
    until @logics.all? { |l| l.has_value? }
      @logics.each do |logic|
        logic.try_resolve(@logics) unless logic.has_value?
      end
    end
    # horrible, repeatedly iterate over signals until we have them all
  end
end
