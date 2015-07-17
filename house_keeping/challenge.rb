class Challenge
  attr_reader :challenge, :number_of_test_cases

  def initialize(challenge: nil, number_of_test_cases: 1)
    @challenge = challenge
    @number_of_test_cases = number_of_test_cases.to_i
    valid?
  end

  def run
    register
    create_test_cases
  end

  def valid?
    if challenges.include?(challenge) || number_of_test_cases.zero?
      fail "#{@challenge} already exists or invalid number of test cases (should be non zero)!"
    end
    true
  end

  def create_test_cases
    number_of_test_cases.times do |index|
      FileUtils.mkdir_p "./test/fixtures/#{challenge}"
      %w(input output).each do |suffix|
        touch_test_case_file(index, suffix)
      end
    end
  end

  def touch_test_case_file(index, suffix)
      file = "./test/fixtures/#{challenge}/#{index}_#{suffix}.txt"
      FileUtils.touch file
      puts "Created file: #{file}"
  end

  def challenges
    @challenges ||= YAML::load(File.open("./challenges.yml", 'r') { |f| f.read })
  end

  def register
    File.open('./challenges.yml', 'w') do |f|
      f.write YAML::dump(@challenges << challenge)
    end
    puts "Added #{challenge} to challenges.yml"
  end
end
