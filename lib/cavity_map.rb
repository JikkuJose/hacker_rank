module CavityMap
  class CavityPlotter
    def initialize(map: nil)
      @map = map
      mark
    end

    def mark
      inner_indicies
        .select { |row, column| cavity?(row, column) }
        .each { |row, column| @map[row][column] = 'X' }
    end

    def cavity?(row, column)
      [
        [0, -1],
        [0, +1],
        [-1, 0],
        [+1, 0],
      ].all? do |row_shift, column_shift|
        @map[row + row_shift][column + column_shift] < @map[row][column]
      end
    end

    def inner_indicies
      inner_row_indicies.product(inner_column_indicies)
    end

    def inner_row_indicies
      (1..(@map.length - 2)).to_a
    end

    def inner_column_indicies
      (1..(@map.first.length - 2)).to_a
    end

    def to_s
      @map
        .map { |row| row.join }
        .join("\n")
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(text)
      @map = text
        .drop(1)
        .map(&:strip)
        .map { |line| line.chars.map(&:to_i) }
    end

    def result
      CavityPlotter.new(map: @map).to_s
    end

    def self.run
      puts new.result
    end

    def self.debug
      puts new(source: DATA).result
    end
  end
end

# CavityMap::HackerRank.run
