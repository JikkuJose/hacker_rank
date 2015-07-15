class TimeInWords
  WORDS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'eighteen',
    20 => 'twenty',
    30 => 'thirty',
  }

  def initialize(source: STDIN)
    parse(source.readlines)
  end

  def word
    case @minute
    when 0
      hour + " o' clock"
    when 1
      'one minute past ' + hour
    when 15
      'quarter past ' + hour
    when 2..20
      minute + ' minutes past ' + hour
    when 21..29
      'twenty ' + WORDS[@minute - 20] + ' minutes past ' + hour
    when 30
      'half past ' + hour
    when 45
      'quarter to ' + next_hour
    when 31..39
      'twenty ' + WORDS[@minute - 30] + ' minutes to ' + next_hour
    when 40..58
      WORDS[60 - @minute] + ' minutes to ' + next_hour
    when 59
      'one minute to ' + next_hour
    end
  end

  def minute
    WORDS[@minute]
  end

  def hour
    WORDS[@hour]
  end

  def next_hour
    WORDS[@hour == 12 ? 1 : @hour + 1]
  end

  def parse(text)
    @hour, @minute = text.map(&:to_i)
  end
end

# puts TimeInWords.new.word
