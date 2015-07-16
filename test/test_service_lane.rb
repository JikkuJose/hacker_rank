require_relative './test_helper.rb'
require 'service_lane'

class TestServiceLaneInspector < Minitest::Test
  FIXTURE = './test/fixtures/service_lane/'

  @number_of_test_cases = Dir.glob(FIXTURE + "*").grep(/_input/).length

  @number_of_test_cases.times do |index|
    define_method("test_case_#{index}") do
      input = File.open(FIXTURE + "#{index}_input.txt", 'r')
      output = File.open(FIXTURE + "#{index}_output.txt", 'r').read.strip

      assert_equal(
        output,
        HackerRank.new(source: input).result
      )
    end
  end
end
