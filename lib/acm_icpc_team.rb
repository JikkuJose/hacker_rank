module AcmIcpcTeam
  class Contestants
    def initialize(cvs: [])
      @cvs = cvs
    end

    def team_ids
      @team_ids ||= indicies
        .product(indicies)
        .map { |i| i.sort }
        .sort
        .uniq
    end

    def indicies
      @indicies ||= @cvs.length.times.to_a
    end

    def teams
      @teams ||= team_ids.each_with_object({}) do |id, hash|
        hash[id] = score(*id)
      end
    end

    def score(c1, c2)
      (@cvs[c1].to_i(2) | @cvs[c2].to_i(2)).to_s(2).count('1')
    end

    def maximum_score
      teams.values.max
    end

    def max_teams
      teams.select { |id, score| score == maximum_score }
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
      [c.maximum_score, c.max_teams.length].join("\n")
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
