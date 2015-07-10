class Matrix
  attr_reader :size, :content

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
    y, x = other.size

    search_origin(other.content.first).each.any? do |origin_y, origin_x|
      self.class.new(
        size: [other.size],
        content:  @content[origin_y, y].map { |line| line[origin_x, x] }
      ) == other
    end
  end

  def ==(other)
    @content == other.content
  end

  def search_origin(pattern_head)
    @content.each_with_index.map do |line, index|
      column = line =~ /#{pattern_head}/
      column ? [index, column] : nil
    end
      .compact
  end
end

class GridSearch
  attr_reader :test_cases

  def initialize(source: DATA)
    @input = source.readlines.map(&:strip)
    parse_grids
  end

  def result
    @test_cases
      .map { |grid, pattern| grid =~ pattern }
      .map { |status| status ? 'YES' : 'NO' }
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

# puts GridSearch.new.result
