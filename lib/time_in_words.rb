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
      WORDS[@hour] + " o' clock"
    when 1
      'one minute past ' + WORDS[@hour]
    when 1..20
      WORDS[@minute] + ' minutes past ' + WORDS[@hour]
    when 15
      'quarter past ' + WORDS[@hour]
    when 21..29
      'twenty ' + WORDS[@minute - 20] + ' minutes past ' + WORDS[@hour]
    when 30
      'half past ' + WORDS[@hour]
    when 45
      'quarter to ' + WORDS[(@hour + 1) % 12]
    when 31..59
      WORDS[60 - @minute] + ' minutes to ' + WORDS[(@hour + 1) % 12]
    end
  end

  def parse(text)
    @hour, @minute = text.map(&:to_i)
  end
end

# puts TimeInWords.new.word
