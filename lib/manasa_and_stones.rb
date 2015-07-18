module ManasaAndStones
  class StoneCalculator
    def initialize(number_of_stones: nil, a: nil, b: nil)
      @number_of_stones = number_of_stones
      @hash = {'0' => a, '1' => b}
    end

    def possible_last_stones
      bit_masks
        .map { |mask| mask.chars.map { |bit| @hash[bit] }.reduce(:+) }
        .sort
        .uniq
    end

    def bit_masks
      @number_of_stones.times.map do |index|
        (2**index - 1).to_s(2).rjust(@number_of_stones - 1, '0')
      end
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines.drop(1).each_slice(3).map do |number_of_stones, a, b|
        [number_of_stones.to_i, a.to_i, b.to_i]
      end
    end

    def result
      @test_cases
        .map do |n, a, b|
        StoneCalculator
          .new(number_of_stones: n, a: a, b: b)
          .possible_last_stones
          .join(" ")
      end
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

ManasaAndStones::HackerRank.run
