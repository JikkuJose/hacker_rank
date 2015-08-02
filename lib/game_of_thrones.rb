module GameOfThrones
  class Anagrams
    def initialize(string)
      @string = string
    end

    def any_palidromes?
      @string
        .each_char
        .group_by(&:to_s)
        .values
        .map(&:count)
        .reject(&:even?)
        .count < 2
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @input = source.read.chomp
    end

    def result
      Anagrams
        .new(@input)
        .any_palidromes? ? 'YES' : 'NO'
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

GameOfThrones::HackerRank.run
