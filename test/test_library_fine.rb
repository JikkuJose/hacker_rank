require_relative './test_helper'
require 'library_fine'

class TestLibrary < Minitest::Test
  def setup
    @given_input = StringIO.new("9 6 2015\n6 6 2015\n")
    @given_output = 45
  end

  def test_given
    assert_equal @given_output, Library.new(source: @given_input).fine
  end

  def test_some_examples
    [
      [45, StringIO.new("9 6 2015\n6 6 2015\n")],
      [0, StringIO.new("9 5 2015\n6 6 2015\n")],
      [10000, StringIO.new("9 5 2019\n6 6 2015\n")],
      [1000, StringIO.new("9 8 2015\n6 6 2015\n")],
    ].each do |expected, input|
      assert_equal expected, Library.new(source: input).fine
    end
  end
end
