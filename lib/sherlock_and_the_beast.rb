module SherlockAndTheBeast
  class DecentNumberGenerator
    def initialize(digits: 0)
      @digits = digits
    end

    def largest
      partition = (0..@digits).find do |digit|
        number_of_threes = digit
        number_of_fives = @digits - digit

        (number_of_threes % 5).zero? && (number_of_fives % 3).zero?
      end

      return nil if partition.nil?

      number_of_threes = partition
      number_of_fives = @digits - partition

      ("5" * number_of_fives + "3" * number_of_threes).to_i
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
        .map(&:strip)
        .map(&:to_i)
    end

    def result
      @test_cases.map do |test_case|
        DecentNumberGenerator
          .new(digits: test_case)
          .largest
      end
        .map { |n| n.nil? ? -1 : n }
        .join("\n")
    end

    def self.run
      unless local_environment?
        puts new.result
      end
    end

    def self.local_environment?
      ENV['UPSTART_JOB'].nil?
    end

    def self.debug
      puts new(source: DATA).result
    end
  end
end

SherlockAndTheBeast::HackerRank.run
