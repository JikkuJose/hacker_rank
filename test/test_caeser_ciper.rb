require_relative './test_helper'
require 'caeser_cipher'

class CaeserCipherTest < Minitest::Test
  def setup
    @given_input = StringIO.new(<<-INPUT
11
middle-Outz
2
INPUT
)

    @given_output = 'okffng-Qwvb'
  end

  def test_given
    assert_equal CaeserCipher.new(source: @given_input).cipher, @given_output
  end
end
