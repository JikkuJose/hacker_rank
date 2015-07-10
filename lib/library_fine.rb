require 'date'

class Library
  def initialize(source: DATA)
    @returned_date, @due_date = parse_dates(source.read)
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

  def parse_dates(text)
    text.split("\n").map { |date| Date.strptime(date, '%d %m %Y') }
  end

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

# puts Library.new(source: STDIN).fine
