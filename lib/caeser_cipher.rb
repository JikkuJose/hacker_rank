module CaeserCipher
  class Encryptor
    def initialize(message: nil, shift: nil)
      @message, @shift = message, shift
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
  end

  class HackerRank
    def initialize(source: STDIN)
      parse(source.read)
    end

    def parse(text)
      @message = lines(text)[1]
      @shift = lines(text).last.to_i
    end

    def lines(text)
      text.split("\n")
    end

    def result
      Encryptor.new(message: @message, shift: @shift).cipher
    end

    def self.run
      puts new.result
    end

    def self.debug
      puts new(source: DATA).result
    end
  end
end

# CaeserCipher::HackerRank.run
