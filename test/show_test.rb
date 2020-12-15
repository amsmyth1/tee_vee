require 'minitest/autorun'
require 'minitest/pride'
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

  def test_show_total_salary
    character_1 = mock
    character_2 = mock
    character_1.stubs(:salary).returns(1)
    character_2.stubs(:salary).returns(2)
    show = Show.new("Knight Rider", "Glen Larson", [character_1, character_2])

    assert_equal 3, show.total_salary
  end

  def test_highest_paid_actor
    character_1 = mock
    character_2 = mock
    character_1.stubs(:salary).returns(1)
    character_2.stubs(:salary).returns(2)
    character_1.stubs(:actor).returns("William Daniaels")
    character_2.stubs(:actor).returns("David Hasselhoff")
    # character_1 = Character.new({
    #                     name: "KITT",
    #                     actor: "William Daniels",
    #                     salary: 1_000_000})
    # character_2 = Character.new({
    #                     name: "Michael Knight",
    #                     actor: "David Hasselhoff",
    #                     salary: 1_600_000})
    show = Show.new("Knight Rider", "Glen Larson", [character_1, character_2])

    assert_equal "David Hasselhoff", show.highest_paid_actor
  end

  def test_actors
    character_1 = mock
    character_2 = mock
    character_1.stubs(:salary).returns(1)
    character_2.stubs(:salary).returns(2)
    character_1.stubs(:actor).returns("William Daniaels")
    character_2.stubs(:actor).returns("David Hasselhoff")
    show = Show.new("Knight Rider", "Glen Larson", [character_1, character_2])

    assert_equal ["William Daniaels", "David Hasselhoff"], show.actors
  end
end
