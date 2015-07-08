class Matrix
  def initialize(source: STDIN)
    @input = source.read
    # rows
  end

  def size
    @size ||= lines.first.to_i
  end

  def rows
    @rows ||= lines[1..-1].map { |line| line.split.map(&:to_i) }
  end

  def diagonal_difference
    (sum_of_right_diagonal - sum_of_left_diagonal).abs
  end

  private

  def sum_of_right_diagonal
    right_diagonal.reduce(:+)
  end

  def sum_of_left_diagonal
    left_diagonal.reduce(:+)
  end

  def left_diagonal
    size.times.map { |index| rows[index][index] }
  end

  def right_diagonal
    size.times.map { |index| rows[size - 1 - index][index] }
  end

  def lines
    @input.split("\n")
  end
end

puts Matrix.new.diagonal_difference

__END__
3
11 2 4
4 5 6
10 8 -12
