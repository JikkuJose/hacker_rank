class Factorial
  def initialize(source: STDIN)
    @n = source.read.to_i
  end

  def result
    factorial(@n)
  end

  private

  def factorial(i)
    return 1 if i < 2
    i * factorial(i - 1)
  end
end

Factorial.new.result

__END__
25
