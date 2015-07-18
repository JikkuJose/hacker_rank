module AcmIcpcTeam
  class Contestants
    attr_reader :maximum_score, :number_of_max_teams

    def initialize(cvs: [])
      @cvs = cvs
      @number_of_contestants = @cvs.length
      @number_of_topics = @cvs.first.length
      @maximum_score = 0
      @number_of_max_teams = @number_of_contestants
      calculate
    end

    def calculate
      (0...@number_of_contestants).each do |i|
        ((i + 1)...@number_of_contestants).each do |j|
          s = score(i, j)

          case
          when @maximum_score < s
            @maximum_score = s
            @number_of_max_teams = 1
          when @maximum_score == s
            @number_of_max_teams += 1
          end
        end
      end
    end

    def score(i, j)
      (@cvs[i].to_i(2) | @cvs[j].to_i(2)).to_s(2).count('1')
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @cvs = lines.drop(1)
    end

    def result
      c = Contestants.new(cvs: @cvs)
      [c.maximum_score, c.number_of_max_teams].join("\n")
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

AcmIcpcTeam::HackerRank.run
