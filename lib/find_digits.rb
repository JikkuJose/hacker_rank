module FindDigits
  class DivisibleDigitsCounter
    def initialize(number: 0)
      @number = number
    end

    def count
      @number
        .to_s
        .chars
        .count { |digit| (@number % digit.to_i == 0) unless digit == '0' }
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
        .map(&:to_i)
    end

    def result
      @test_cases
        .map { |test_case| DivisibleDigitsCounter.new(number: test_case).count }
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

FindDigits::HackerRank.run
