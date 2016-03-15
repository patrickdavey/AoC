require "pry"
require "./sue.rb"

class Searcher
  ATTRIBUTES_TO_CHECK = [:children, :cats, :samoyeds, :pomeranians,
    :akitas, :vizslas, :goldfish, :trees, :cars, :perfumes].freeze

  def initialize(children:, cats:, samoyeds:, pomeranians:, akitas:, vizslas:,
                goldfish:, trees:, cars:, perfumes:)
    @children = children
    @cats = cats
    @samoyeds = samoyeds
    @pomeranians = pomeranians
    @akitas = akitas
    @vizslas = vizslas
    @goldfish = goldfish
    @trees = trees
    @cars = cars
    @perfumes = perfumes
    @sues = []
  end

  def <<(sue)
    @sues << sue
  end

  def find_matching_sue!(remaining_collection = sues, index = 0)
    return remaining_collection.first.name if remaining_collection.size == 1

    if index == ATTRIBUTES_TO_CHECK.length
      return remaining_collection.find do |sue|
        sue.perfumes == perfumes
      end.name
    else
      remaining_collection = sues.find_all do |sue|
        sue.send(ATTRIBUTES_TO_CHECK[index]) == send(ATTRIBUTES_TO_CHECK[index]) ||
        sue.send(ATTRIBUTES_TO_CHECK[index]) == nil
      end
      find_matching_sue!(remaining_collection, index + 1)
    end

  end


  private

  attr_reader :sues, :children, :cats, :samoyeds, :pomeranians,
    :akitas, :vizslas, :goldfish, :trees, :cars, :perfumes
end
