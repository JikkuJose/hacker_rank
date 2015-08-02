module GemStones
  class Analyzer
    def initialize(gem_stones: [])
      @gem_stones = gem_stones.map(&:chars)
      @first = @gem_stones.first
    end

    def number_of_gem_elements
      @gem_stones
        .inject(@first) { |intersection, gem_stone| intersection & gem_stone }
        .count
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_case = lines
        .drop(1)
        .map(&:chomp)
    end

    def result
      Analyzer
        .new(gem_stones: @test_case)
        .number_of_gem_elements
        .to_s
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

GemStones::HackerRank.run
