module MakeItAnagram
  class AnagramMaker
    def initialize(strings: [])
      @first, @second = strings.map(&:chars)
    end

    def extra_characters
      first_hash = create_hash(@first)
      second_hash = create_hash(@second)

      (@first | @second).inject(0) do |sum, c|
        sum += (first_hash[c].to_i - second_hash[c].to_i).abs
      end
    end

    def create_hash(array)
      array.each_with_object({}) do |c, hash|
        hash[c] ||= 0
        hash[c] += 1
      end
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .map(&:chomp)
    end

    def result
      AnagramMaker
        .new(strings: @test_cases)
        .extra_characters
        .to_s
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

MakeItAnagram::HackerRank.run
