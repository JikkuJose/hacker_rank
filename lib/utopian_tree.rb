module UtopianTree
  class Tree
    def initialize(intial_height: 1, growth_cycles: 0)
      @intial_height = intial_height
      @growth_cycles = growth_cycles
      @height = intial_height
    end

    def height
      @growth_cycles.times do |index|
        @height += index.even? ? spring_cycle_increase : summer_cycle_increase
      end

      @height
    end

    def spring_cycle_increase
      @height
    end

    def summer_cycle_increase
      1
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.readlines)
    end

    def parse(lines)
      @test_cases = lines
        .drop(1)
        .map(&:to_i)
    end

    def result
      @test_cases.map do |test_case|
        Tree
          .new(growth_cycles: test_case)
          .height
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

UtopianTree::HackerRank.run
