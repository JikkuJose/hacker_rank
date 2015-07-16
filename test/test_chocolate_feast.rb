require_relative './test_helper'

CHALLENGE = __FILE__.match(/\/test_(?<challenge>.*).rb/)[:challenge]
require CHALLENGE

class TestChocolate < TestHackerRank
  def self.challenge
    CHALLENGE
  end

  define_test_methods
end
