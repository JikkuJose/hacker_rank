class CaeserCipher
  def initialize(source: STDIN)
    parse(source.read)
  end

  def cipher
    @message.tr(
      alphabets(shift: 0).join,
      alphabets(shift: @shift).join
    )
  end

  private

  def alphabets(shift: 0)
    small_caps.rotate(shift) + large_caps.rotate(shift)
  end

  def small_caps
    ('a'..'z').to_a
  end

  def large_caps
    small_caps.map(&:upcase)
  end

  def parse(text)
    @message = lines(text)[1]
    @shift = lines(text).last.to_i
  end

  def lines(text)
    text.split("\n")
  end
end

# puts CaeserCipher.new.cipher

__END__
11
middle-Outz
2
