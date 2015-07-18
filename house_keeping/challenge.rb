class Challenge
  attr_reader :challenge, :number_of_test_cases
  README_LIST = /(?<=``` challenges)(?<list>.*?)(?=```)/m

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
    @challenges ||= self.class.challenges
  end

  def register
    add_in_config
    add_in_readme
  end

  def add_in_config
    File.open('./challenges.yml', 'w') do |f|
      f.write YAML::dump(@challenges << challenge)
    end
    puts "Added #{challenge} to challenges.yml"
  end

  def add_in_readme
    old_file = File.open('./README.markdown', 'r') { |f| f.read }


    new_file = old_file.gsub(README_LIST) do |m|
      "\n#{self.class.challenge_list}\n"
    end

    File.open('./README.markdown', 'w') { |f| f.write new_file }

    puts "Added #{challenge} to README.markdown"
  end

  def self.challenge_list
    challenges.each_with_index
      .map { |challenge, index| "#{index + 1}. #{challenge}" }
      .join("\n")
  end

  def self.challenges
    YAML::load(File.open("./challenges.yml", 'r') { |f| f.read })
  end
end
