module Staircase
  class StairCaseGenerator
    attr_reader :symbol, :height

    def initialize(symbol: '#', height: 0)
      @symbol = symbol
      @height = height
    end

    def to_s
      (1..height)
        .map { |index| (symbol * index).rjust(height, ' ') }
        .join("\n")
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @height = source.read.to_i
    end

    def result
      StairCaseGenerator.new(height: @height).to_s
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

Staircase::HackerRank.run
