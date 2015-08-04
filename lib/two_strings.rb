module TwoStrings
  class SubString
    def initialize(strings: [])
      @first, @second = strings.map(&:chars)
    end

    def present?
      !(@first & @second).empty?
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
        .map(&:chomp)
        .each_slice(2)
    end

    def result
      @test_cases
        .map { |test_case| SubString.new(strings: test_case).present? }
        .map { |present| present ? 'YES' : 'NO' }
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

TwoStrings::HackerRank.run
