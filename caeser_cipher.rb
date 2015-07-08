class CaeserCipher
  def initialize(source: STDIN)
    parse(source.read)
  end

  def cipher
    @message.tr(plain_alphabets, rotated_alphabets)
  end

  def rotated_alphabets
    alphabets.rotate(@shift).join
  end

  def plain_alphabets
    alphabets.join
  end

  private

  def alphabets
    ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def parse(text)
    @message = lines(text)[1]
    @shift = lines(text).last.to_i
  end

  def lines(text)
    text.split("\n")
  end
end

puts CaeserCipher.new(source: DATA).cipher

__END__
11
middle-Outz
2
