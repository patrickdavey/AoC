require "minitest/autorun"
require "./boss.rb"
require "pry"

class BossTest < Minitest::Test
  def test_basic_boss
    boss = Boss.new(0, 0)
    assert_equal true, boss.dead?
  end
end
