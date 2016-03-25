require "minitest/autorun"
require "./player_generator.rb"
require "pry"

class PlayerGeneratorTest < Minitest::Test
  def test_no_players
    player_generator = PlayerGenerator.new(0)
    assert_equal 0, player_generator.count
  end

  def test_single_player
    player_generator = PlayerGenerator.new(8)
    assert_equal 1, player_generator.count
  end

  def test_multiple_players
    player_generator = PlayerGenerator.new(21)
    assert_equal 3, player_generator.count
    assert player_generator.to_a[0].total_cost < player_generator.to_a[1].total_cost && player_generator.to_a[1].total_cost < player_generator.to_a[2].total_cost
  end
end
