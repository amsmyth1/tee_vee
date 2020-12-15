require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require './lib/character'
require './lib/show'
require 'mocha/minitest'
require 'pry'

class NetworkTest < MiniTest::Test

  def test_it_exists
    network = Network.new("ABC")

    assert_instance_of Network, network
  end

  def test_it_has_readable_attributes
    character_1 = mock
    character_2 = mock
    show = mock

    network = Network.new("ABC")

    assert_equal "ABC", network.name
    assert_equal [], network.shows
  end

  def test_shows_can_be_added_to_network
    character_1 = mock
    character_2 = mock
    show1 = mock
    show2 = mock

    network = Network.new("ABC")
    network.add_show(show1)

    assert_equal [show1], network.shows

    network.add_show(show2)

    assert_equal [show1, show2], network.shows
  end

  def test_actors_over_500k
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    # character_2 = mock
    # show1 = mock
    # character_1.stubs(:salary).returns(600_000)
    # character_2.stubs(:salary).returns(500_000)
    # show1.stubs(:character).returns([character_1, character_2])

    network = Network.new("ABC")
    network.add_show(knight_rider)
    network.add_show(parks_and_rec)

    assert_equal [michael_knight, kitt], network.main_characters_over_500k(knight_rider)
  end

  def test_characters_in_upcase
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    network = Network.new("ABC")
    network.add_show(knight_rider)
    network.add_show(parks_and_rec)

    assert_equal [kitt], network.main_characters_in_upcase(knight_rider)
  end

  def test_main_characters
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "LESLIE KNOPE", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    network = Network.new("ABC")
    network.add_show(knight_rider)
    network.add_show(parks_and_rec)

    assert_equal [kitt, leslie_knope], network.main_characters
  end
end
