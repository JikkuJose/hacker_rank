class Encryptor
  def initialize(message: text)
    @message = message
  end

  def cipher
    width
      .times
      .map { |index| rows.map { |row| row[index] }.join }
      .join(' ')
  end

  private

  def rows
    @rows ||= @message.chars.each_slice(width)
  end

  def width
    square_root.ceil
  end

  def square_root
    @square_root ||= Math.sqrt(@message.length)
  end
end

class HackerRank
  def initialize(source: STDIN)
    @input = source.read.strip
  end

  def result
    Encryptor.new(message: @input).cipher
  end

  def self.run
    puts new.result
  end
end

# HackerRank.run
