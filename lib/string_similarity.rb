module StringSimilarity
  class SimilarityChecker
    attr_reader :length, :string

    def initialize(string: "")
      @string = string
      @length = @string.length
    end

    def similarity
      total = length

      length.times do |index|
        (index..length).each_with_index do |j, k|
          if string[j] != string[k]
            total += k
            break
          end
        end
      end

      total
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
        .map(&:chomp)
    end

    def result
      @test_cases.map do |test_case|
        SimilarityChecker
          .new(string: test_case)
          .similarity
      end
        .join("\n")
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

StringSimilarity::HackerRank.run
