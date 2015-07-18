module DiagonalDifference
  class Matrix
    attr_reader :rows

    def initialize(rows: nil)
      @rows = rows
    end

    def size
      @size ||= @rows.length
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
  end

  class HackerRank
    def initialize(source: STDIN)
      @input = source.read
    end

    def result
      Matrix.new(rows: rows).diagonal_difference.to_s
    end

    def rows
      @rows ||= lines.drop(1).map { |line| line.split.map(&:to_i) }
    end

    def lines
      @input.split("\n")
    end

    def self.run
      unless local_environment?
        puts new.result
      end
    end

    def self.local_environment?
      ENV['UPSTART_JOB'].nil?
    end

    def self.debug
      puts new(source: DATA).result
    end
  end
end

DiagonalDifference::HackerRank.run
