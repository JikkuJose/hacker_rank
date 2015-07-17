module TimeConversion
  class Converter
    def initialize(input)
      @input = input
    end

    def format_24_hour
      "#{new_hour}:#{minute}:#{second}"
    end

    private

    def new_hour
      (add_12? ? (hour + 12) % 24 : hour).to_s.rjust(2, '0')
    end

    def add_12?
      (hour == 12 && am?) || (hour < 12 && pm?)
    end

    def hour
      @input[0, 2].to_i
    end

    def minute
      @input[3, 2]
    end

    def second
      @input[6, 2]
    end

    def am?
      !pm?
    end

    def pm?
      @input[-2..-1] == 'PM'
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @input = source.read.strip
    end

    def result
      Converter.new(@input).format_24_hour
    end

    def self.run
      puts new.result
    end

    def self.debug
      puts new(source: DATA).result
    end
  end
end

# HackerRank.run
__END__
