module PlusMinus
  class NumberDistributions
    attr_reader :array

    def initialize(array: nil)
      @array = array
    end

    def to_s
      [
        positive_fraction,
        negative_fraction,
        zero_fraction
      ]
        .map { |line| line.round(3) }
        .join("\n")
    end

    def total
      @total ||= @array.length
    end

    def postives
      array.count { |n| n > 0 }.to_f
    end

    def negatives
      array.count { |n| n < 0 }.to_f
    end

    def zeros
      array.count { |n| n == 0 }.to_f
    end

    def positive_fraction
      postives / total
    end

    def negative_fraction
      negatives / total
    end

    def zero_fraction
      zeros / total
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @input = source.read.split("\n")
    end

    def result
      NumberDistributions.new(array: array).to_s
    end

    def array
      @input.last.split.map(&:to_i)
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

PlusMinus::HackerRank.run
