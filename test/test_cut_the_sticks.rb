require_relative './test_helper'
require 'cut_the_sticks.rb'

class TestCutTheSticks < Minitest::Test
  FIXTURE = './test/fixtures/cut_the_sticks/samples.yml'

  @samples = YAML::load File.open(FIXTURE, 'r').read

  @samples.each_with_index do |(input, output), index|
    define_method("test_sample_#{index}") do
      assert_equal output, StickCutter.new(sticks: input).stages
    end
  end
end
