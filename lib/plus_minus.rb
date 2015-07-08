class NumberDistributions
  def initialize(source: STDIN)
    @input = source.read.split("\n")
  end

  def result
    [
      positive_fraction,
      negative_fraction,
      zero_fraction
    ].map { |line| line.round(3) }
  end

  def total_count
    @total_count ||= @input.first.to_i
  end

  def array
    @array ||= @input.last.split.map(&:to_i)
  end

  def positive_count
    array.count { |n| n > 0 }
  end

  def negative_count
    array.count { |n| n < 0 }
  end

  def zero_count
    array.count { |n| n == 0 }
  end

  def positive_fraction
    positive_count.to_f / total_count
  end

  def negative_fraction
    negative_count.to_f / total_count
  end

  def zero_fraction
    zero_count.to_f / total_count
  end
end

puts NumberDistributions.new.result

__END__
6
-4 3 -9 0 4 1
