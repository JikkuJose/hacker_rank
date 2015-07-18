module Add
  class List
    def initialize(array)
      @array = array
    end

    def sum
      @array.reduce(:+)
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @array = lines
        .drop(1)
        .first
        .split
        .map(&:to_i)
    end

    def result
      List.new(@array).sum.to_s
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

Add::HackerRank.run
