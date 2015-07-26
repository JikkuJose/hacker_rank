module FunnyString
  module Funny
    def funny?
      (0...(length - 1)).all? do |index|
        absolute_adjacent_difference(index) == absolute_adjacent_difference(-2 - index)
      end
    end

    def absolute_adjacent_difference(index)
      (self[index].ord - self[index + 1].ord).abs
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
    end

    def result
      @test_cases
        .map { |test_case| test_case.extend(Funny).funny? }
        .map { |funny| funny ? 'Funny' : 'Not Funny' }
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

FunnyString::HackerRank.run
