require 'yaml'
require 'minitest/autorun'
require 'minitest/reporters'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})

class TestHackerRank < Minitest::Test
  def self.challenge
    fail 'Should be redefined in subclass'
  end

  def self.fixture
    "./test/fixtures/#{challenge}/"
  end

  def self.samples
    Dir.glob(fixture + '*').grep(/_input/).length
  end

  def self.define_test_methods
    samples.times do |index|
      define_method("test_sample_#{index}") do
        assert_equal(
          file(index, :output).read.strip,
          HackerRank.new(source: file(index, :input)).result
        )
      end
    end
  end

  def file(index, suffix)
    File.open("#{self.class.fixture}#{index}_#{suffix}.txt", 'r')
  end
end

Minitest::Runnable.runnables.delete(TestHackerRank)
