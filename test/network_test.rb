require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require 'mocha/minitest'

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
end
