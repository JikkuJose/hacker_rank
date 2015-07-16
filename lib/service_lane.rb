class ServiceLaneInspector
  def initialize(width_array: text)
    parse_width(width_array)
  end

  def max_width(entry_exit: text)
    parse_entry_exit(entry_exit)
    @width[@entry..@exit].min
  end

  def parse_width(text)
    @width = text.split.map(&:to_i)
  end

  def parse_entry_exit(text)
    @entry, @exit = text.split.map(&:to_i)
  end
end

class HackerRank
  def initialize(source: STDIN)
    @input = source.readlines.drop(1)
  end

  def result
    s = ServiceLaneInspector.new(width_array: @input.first)
    @input.drop(1).map { |line| s.max_width(entry_exit: line) }.join("\n")
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
8 5
2 3 1 2 3 2 3 3
0 3
4 6
6 7
3 5
0 7
