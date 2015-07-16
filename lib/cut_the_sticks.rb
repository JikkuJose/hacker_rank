class StickCutter
  def initialize(sticks: input)
    @sticks = sticks.split(' ').map(&:to_i)
  end

  def stages
    stick_stages = @sticks.dup
    accumilator = []

    until(stick_stages.length.zero?)
      accumilator << stick_stages.length
      minimum = stick_stages.min
      stick_stages -= [minimum]
      stick_stages = stick_stages.map { |n| n - minimum }
    end

    accumilator.join("\n")
  end
end

class HackerRank
  def initialize(source: STDIN)
    @input = source.readlines.drop(1).first
  end

  def result
    StickCutter.new(sticks: @input).stages
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
8
1 2 3 4 3 3 2 1
