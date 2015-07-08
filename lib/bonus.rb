%w(
  Hacker
  Submission
  Contest
  TestCase
).each { |klass| Object.const_set(klass, Class.new) }

def identify_class(obj)
  string = case obj
           when Hacker
             "It's a Hacker!"
           when Submission
             "It's a Submission!"
           when TestCase
             "It's a TestCase!"
           when Contest
             "It's a Contest!"
           else
             "It's an unknown model"
           end
  puts string
end

identify_class(Hacker.new)
