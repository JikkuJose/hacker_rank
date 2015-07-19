module KaprekarNumbers
  class KaprekarSet
    def initialize(range: 0..1)
      @range = range
    end

    def set
      @range.select { |number| karprekar?(number) }
    end

    def karprekar?(number)
      digits = number.to_s.length
      square = (number**2).to_s

      l = square[0, square.length - digits].to_i
      r = square[(square.length - digits)..-1].to_i

      number == l + r
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      start, stop = source.readlines.map(&:chomp).map(&:to_i)
      @range = start..stop
    end

    def result
      numbers = KaprekarSet
        .new(range: @range)
        .set

      numbers.empty? ? 'INVALID RANGE' : numbers.join(' ')
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

KaprekarNumbers::HackerRank.run
