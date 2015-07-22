module StringSimilarity
  module ZAlgorithm
    def z
      @z = Array.new(length, 0)
      @z[0] = length
      l = r = 0

      (1...length).each do |k|
        if k <= r  # INSIDE Z BOX
          if @z[k - l] <= r - k
            j = 0
            while self[k + j] == self[j] && j <= r - k + 1
              j += 1
            end
            @z[k] = j

            if j > 0
              l = k
              r = k + @z[k] - 1
            end
          else
            @z[k] = r - k + 1
            l = k
            r = k + @z[k] - 1
          end
        else
          n = 0
          while k < length && self[k + n] == self[n]
            n += 1
          end
          @z[k] = n

          if n > 0
            l = k
            r = k + @z[k] - 1
          end
        end
      end
      @z
    end
  end

  class SimilarityChecker
    attr_reader :length, :string

    def initialize(string: "")
      @string = string.extend(ZAlgorithm)
    end

    def similarity
      string.z.reduce(:+)
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
