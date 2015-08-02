module AlternatingCharacters
  class RepeatDeletor
    def initialize(text)
      @text = text
    end

    def count
      previous_character = nil

      @text.each_char.inject(0) do |sum, character|
        sum += 1 if character == previous_character
        previous_character = character
        sum
      end
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
    end

    def result
      @test_cases.map do |test_case|
        RepeatDeletor
          .new(test_case)
          .count
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

AlternatingCharacters::HackerRank.run
