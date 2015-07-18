module SongOfPi
  class Song
    PI_DIGITS = "31415926535897932384626433833"

    def initialize(text)
      @text = text
    end

    def pi?
      PI_DIGITS.start_with? to_digits
    end

    def to_digits
      @text
        .downcase
        .gsub(/[^a-z\s]/, '')
        .split
        .map(&:length)
        .join
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @lines = source.readlines.drop(1)
    end

    def result
      @lines
        .map { |line| Song.new(line).pi? ? yes_text : no_text }
        .join("\n")
    end

    def no_text
      "It's not a pi song."
    end

    def yes_text
      "It's a pi song."
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

SongOfPi::HackerRank.run
