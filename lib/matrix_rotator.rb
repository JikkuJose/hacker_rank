class Matrix
  def initialize(two_d_array: nil)
    @data = two_d_array
  end

  def rotate!(anti_clockwise: 0)
    rotated = layers
      .map { |layer| layer.map { |row, column| @data[row][column] } }
      .map { |layer| layer.rotate(anti_clockwise) }

    coordinates.zip(rotated.flatten).each do |(row, column), n|
      @data[row][column] = n
    end

    self
  end

  def to_s
    @data
      .map { |row| row.join(' ') }
      .join("\n")
  end

  def height
    @height ||= @data.length
  end

  def width
    @width ||= @data.first.length
  end

  private

  def number_of_layers
    [height, width].min / 2
  end

  def coordinates
    layers.each_with_object([]) { |layer, a| a.push(*layer) }
  end

  def layers
    number_of_layers.times.map do |index|
      mapping(index).each_with_object([]) do |(length, lambda), accumilator|
        accumilator.push(*side(index, length, &lambda))
      end
    end
  end

  def segment(index, length)
    (length - (2 * index) - 1).times
  end

  def mapping(index)
    [
      [width, lambda { |w| [index, w + index] }],
      [height, lambda { |h| [h + index, width - index - 1] }],
      [width, lambda { |w| [height - index - 1, width - index - w - 1] }],
      [height, lambda { |h| [height - 1 - index - h, index] }],
    ]
  end

  def side(index, length, &block)
    segment(index, length).map(&block)
  end
end

class MatrixRotator
  def initialize(source: nil)
    parse(source.readlines)
  end

  def result
    Matrix
      .new(two_d_array: two_d_array)
      .rotate!(anti_clockwise: @shift)
      .to_s
  end

  def parse(lines)
    parameters, *@content = lines.map(&:strip)
    @shift = parameters.split.map(&:to_i).last
  end

  def two_d_array
    @content.map { |line| line.split.map(&:to_i) }
  end
end

# puts MatrixRotator.new(source: STDIN).result
