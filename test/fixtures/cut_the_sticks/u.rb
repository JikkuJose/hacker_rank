require 'yaml'

test_cases = YAML::load(File.open('./samples.yml', 'r').read)

test_cases.each_with_index do |(input, output), index|
  File.open("#{index}_input.txt", "w") { |f| f.write input }
  File.open("#{index}_output.txt", "w") { |f| f.write output }
end
