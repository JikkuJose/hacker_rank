require 'date'

module LibraryFine
  class Library
    def initialize(returned_date: nil, due_date: nil)
      @returned_date, @due_date = returned_date, due_date
    end

    def fine
      case
      when no_dues?
        0
      when same_month?
        delta_days * 15
      when same_year?
        delta_months * 500
      else
        10_000
      end
    end

    private

    def same_month?
      same_year? && (@returned_date.month == @due_date.month)
    end

    def same_year?
      @returned_date.year == @due_date.year
    end

    def delta_days
      @returned_date.day - @due_date.day
    end

    def delta_months
      @returned_date.month - @due_date.month
    end

    def no_dues?
      @returned_date <= @due_date
    end
  end

  class HackerRank
    def initialize(source: STDIN)
      @returned_date, @due_date = parse_dates(source.read)
    end

    def parse_dates(text)
      text.split("\n").map { |date| Date.strptime(date, '%d %m %Y') }
    end

    def result
      Library.new(returned_date: @returned_date, due_date: @due_date).fine.to_s
    end

    def self.run
      puts new.result
    end

    def self.debug
      puts new(source: DATA).result
    end
  end
end
