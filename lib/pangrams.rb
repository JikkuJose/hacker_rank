module Pangrams
  module Pangram
    def pangram?
      self
        .downcase
        .each_char
        .to_a
        .sort
        .uniq
        .reject { |c| c == ' ' }
        .[](0..25) == ('a'..'z').to_a
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @input = source.read.chomp
    end

    def result
      @input
        .extend(Pangram)
        .pangram? ? 'pangram' : 'not pangram'
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

Pangrams::HackerRank.run
