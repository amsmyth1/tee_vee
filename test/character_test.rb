require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require 'mocha/minitest'

class CharacterTest < MiniTest::Test
  def test_it_exists
    character = Character.new({
                        name: "KITT",
                        actor: "William Daniels",
                        salary: 1_000_000})

    assert_instance_of Character, character
  end

  def test_it_has_readable_attributes
    kitt = Character.new({
                        name: "KITT",
                        actor: "William Daniels",
                        salary: 1_000_000})

    assert_equal "KITT", kitt.name
    assert_equal "William Daniels", kitt.actor
    assert_equal 1_000_000, kitt.salary
  end
end
