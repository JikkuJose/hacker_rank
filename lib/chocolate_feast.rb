class ChocolateCalculator
  def initialize(input: text)
    parse(input)
  end

  def chocolates
    chocolates_that_money_can_buy + chocolates_that_wrappers_can_exchange_for
  end

  def chocolates_that_money_can_buy
    @money / @cost
  end

  def chocolates_that_wrappers_can_exchange_for
    wrappers = chocolates_that_money_can_buy
    chocolates = 0

    until(wrappers < @wrapper_exchange_rate)
      c = wrappers / @wrapper_exchange_rate
      chocolates += c
      wrappers %= @wrapper_exchange_rate
      wrappers += c
    end

    chocolates
  end

  def parse(input)
    @money, @cost, @wrapper_exchange_rate = input.split.map(&:to_i)
  end
end

class HackerRank
  def initialize(source: STDIN)
    @input = source.readlines.drop(1).map(&:strip)
  end

  def result
    @input.map { |text| ChocolateCalculator.new(input: text).chocolates }.join("\n")
  end

  def self.run
    puts new.result
  end

  def self.debug
    puts new(source: DATA).result
  end
end

# HackerRank.run
__END__
3
10 2 5
12 4 4
6 2 2
