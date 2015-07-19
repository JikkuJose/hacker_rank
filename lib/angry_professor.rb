module AngryProfessor
  class Professor
    def initialize(
      minimum_attendance_required: 0,
      attendance: []
    )
      @minimum_attendance_required = minimum_attendance_required
      @attendance = attendance
    end

    def will_cancel_class?
      @minimum_attendance_required > @attendance.count { |a| a <= 0 }
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
        .each_slice(2)
        .each_with_object([]) do |(n_k, attendance), array|
        minimum_attendance_required = n_k.split.last.to_i
        array << [minimum_attendance_required, attendance.split.map(&:to_i)]
      end
    end

    def result
      @test_cases.map do |m, a|
        Professor.new(
          minimum_attendance_required: m,
          attendance: a
        ).will_cancel_class?
      end
        .map { |status| status ? 'YES' : 'NO' }
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

AngryProfessor::HackerRank.run
