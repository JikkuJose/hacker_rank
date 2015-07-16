require_relative './test_helper'
require 'chocolate_feast'

class TestChocolateFeast < Minitest::Test
  FIXTURE = './test/fixtures/chocolate_feast/samples.yml'

  def self.samples
    YAML::load File.open(FIXTURE, 'r').read
  end

  samples.each_with_index do |(input, output), index|
    define_method("test_sample_#{index}") do
      assert_equal output, ChocolateCalculator.new(input: input).chocolates
    end
  end
end
