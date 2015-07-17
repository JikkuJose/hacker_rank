class Utilities
  def self.camelize(string)
    string.scan(/[a-z]+/).map { |word| word.capitalize }.join
  end
end
