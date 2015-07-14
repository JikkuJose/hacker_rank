require_relative './test_helper'
require 'time_in_words'
require 'yaml'

class TestTimeInWords < Minitest::Test
  FIXTURE = './test/fixtures/time_in_words/samples.yml'

  def self.samples
    YAML::load(File.open(FIXTURE, 'r').read)
  end

  samples.first(8).each_with_index do |(time, word), index|
    define_method("test_sample_#{index}") do
      io = StringIO.new(time.split(":").join("\n"))

      assert_equal(
        word,
        TimeInWords.new(source: io).word
      )
    end
  end
end
