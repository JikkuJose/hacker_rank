require_relative './test_helper'
require 'time_conversion'

class TestTimeConversion < Minitest::Test
  def setup
    @given_input = StringIO.new("07:05:45PM\n")
    @given_output = '19:05:45'
  end

  def test_given
    assert_equal @given_output, TimeConversion.new(source: @given_input).format_24_hour
  end

  def test_some_examples
    [
      [StringIO.new('07:05:45AM'), '07:05:45'],
      [StringIO.new('12:05:45AM'), '00:05:45'],
    ].each do |given, expected|
    assert_equal expected, TimeConversion.new(source: given).format_24_hour
    end
  end
end
