module StringSimilarity
  module ZAlgorithm
    def z
      @z = Array.new(length, 0)
      @z[0] = length
      l = r = 0

      (1...length).each do |k|
        if k > r
          @z[k] = length_of_longest_prefix(k)
          unless @z[k].zero?
            l = k
            r = l + @z[k] - 1
          end
        else
          beta = r - k + 1
          z_prime = @z[k - l]

          case
          when z_prime < beta
            @z[k] = z_prime
            unless z_prime.zero?
              l = k
              r = k + @z[k] - 1
            end
          when z_prime > beta
            @z[k] = beta
            l = k
          when z_prime == beta
            start = beta
            while self[start] == self[k + start]
              start += 1
            end
            @z[k] = start
            l = k
            r = k + @z[k] - 1
          end
        end
      end
      @z
    end

    def length_of_longest_prefix(index)
      n = 0
      while self[index + n] == self[n]
        n += 1
      end
      n
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
