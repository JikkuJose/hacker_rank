require 'yaml'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../house_keeping/utilities.rb'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})

specificity = ARGV.first
challenges = YAML::load(File.open('./challenges.yml', 'r').read).grep(/#{specificity}/)
fail "Sorry, no challenges matched for #{specificity}!" if challenges.empty?

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
    test_klass = Object.const_get("#{Utilities.camelize(challenge)}::HackerRank")

    samples.times do |index|
      define_method("test_sample_#{index}") do
        assert_equal(
          file(index, :output).read.chomp,
          test_klass.new(source: file(index, :input)).result
        )
      end
    end
  end

  def file(index, suffix)
    File.open("#{self.class.fixture}#{index}_#{suffix}.txt", 'r')
  end
end

Minitest::Runnable.runnables.delete(TestHackerRank)

puts "Challenges under test:"
puts

challenges.each_with_index do |library, index|
  require library
  puts "#{index + 1}. #{library}"
end

challenges.each do |challenge|
  Object.const_set("Test#{Utilities.camelize(challenge)}", Class.new(TestHackerRank)).class_eval do
    define_singleton_method(:challenge) do
      challenge
    end

    define_test_methods
  end
end
