module ExtraLongFactorials
  class Factorial
    def self.of(i, accumilator = 1)
      return accumilator if i < 2
      of(i - 1, accumilator * i)
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @input = source.read.to_i
    end

    def result
      Factorial.of(@input).to_s
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

ExtraLongFactorials::HackerRank.run
