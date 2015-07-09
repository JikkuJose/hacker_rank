class Matrix
  def self.pop_top_matrix(lines)
    size = lines.shift.split.map(&:to_i)
    content = lines.shift(size.first)

    new(size: size, content: content)
  end

  def initialize(size: [0, 0], content: nil)
    @size = size
    @content = content
  end

  def =~(other)
    'hey'
  end
end

class GridSearch
  attr_reader :test_cases

  def initialize(source: STDIN)
    @input = source.readlines.map(&:strip)
    parse_grids
  end

  def result
    @test_cases.map { |grid, pattern| grid =~ pattern }
  end

  def number_of_test_cases
    @number_of_test_cases ||= @input.shift.to_i
  end

  def parse_grids
    @test_cases = number_of_test_cases.times.map do |index|
      grid = Matrix.pop_top_matrix(@input)
      pattern = Matrix.pop_top_matrix(@input)

      [grid, pattern]
    end
  end
end

p GridSearch.new(source: DATA).result

__END__
2
10 10
7283455864
6731158619
8988242643
3830589324
2229505813
5633845374
6473530293
7053106601
0834282956
4607924137
3 4
9505
3845
3530
15 15
400453592126560
114213133098692
474386082879648
522356951189169
887109450487496
252802633388782
502771484966748
075975207693780
511799789562806
404007454272504
549043809916080
962410809534811
445893523733475
768705303214174
650629270887160
2 2
99
99
