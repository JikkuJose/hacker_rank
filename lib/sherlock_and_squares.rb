module SherlockAndSquares
  class SquareCounter
    def initialize(start: nil, stop: nil)
      @start, @stop = start, stop
    end

    def count
      Math.sqrt(@stop).floor - Math.sqrt(@start).ceil + 1
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def result
      @ranges
        .map { |start, stop| SquareCounter.new(start: start, stop: stop).count }
        .join("\n")
    end

    def parse(lines)
      @ranges = lines.drop(1).map { |line| line.split.map(&:to_i) }
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

SherlockAndSquares::HackerRank.run
