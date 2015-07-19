module TaumAndBday
  class PriceCalculator
    def initialize(
      black_gifts: 0,
      white_gifts: 0,
      black_price: 0,
      white_price: 0,
      conversion_fees: 0
    )
      @black_gifts = black_gifts
      @white_gifts = white_gifts
      @black_price = black_price
      @white_price = white_price
      @conversion_fees = conversion_fees
    end

    def minimum
      @black_gifts * black_price + @white_gifts * white_price
    end

    def black_price
      conversion_cost = @white_price + @conversion_fees
      conversion_cost > @black_price ? @black_price : conversion_cost
    end

    def white_price
      conversion_cost = @black_price + @conversion_fees
      conversion_cost > @white_price ? @white_price : conversion_cost
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .map(&:chomp)
        .drop(1)
        .each_slice(2)
        .each_with_index
        .each_with_object({}) do |((b_w, x_y_z), index), hash|
        b, w = b_w.split.map(&:to_i)
        x, y, z = x_y_z.split.map(&:to_i)

        hash[index] = {
          b: b,
          w: w,
          x: x,
          y: y,
          z: z,
        }
      end
    end

    def result
      @test_cases.map do |_, test_case|
        PriceCalculator.new(
          black_gifts: test_case[:b],
          white_gifts: test_case[:w],
          black_price: test_case[:x],
          white_price: test_case[:y],
          conversion_fees: test_case[:z],
        ).minimum
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

TaumAndBday::HackerRank.run
