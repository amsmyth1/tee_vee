require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require 'mocha/minitest'

class ShowTest < MiniTest::Test
  def test_it_exists
    character_1 = mock
    character_2 = mock
    show = Show.new("Knight Rider", "Glen Larson", [character_1, character_2])

    assert_instance_of Show, show
  end

  def test_it_has_readable_attributes
    character_1 = mock
    character_2 = mock
    show = Show.new("Knight Rider", "Glen Larson", [character_1, character_2])

    assert_equal "Knight Rider", show.name
    assert_equal "Glen Larson", show.creator
    assert_equal [character_1, character_2], show.characters
  end
end
