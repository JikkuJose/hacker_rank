class StairCase
  SYMBOL = '#'

  def initialize(source: STDIN)
    @height = source.read.to_i
  end

  def draw
    (1..@height).each do |index|
      puts (SYMBOL * index).rjust(@height, ' ')
    end
  end
end

StairCase.new.draw
StairCase.new(source: DATA).draw

__END__
6

