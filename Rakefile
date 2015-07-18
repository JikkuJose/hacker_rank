require 'yaml'
require_relative './house_keeping/challenge'
require_relative './house_keeping/utilities'
require_relative './house_keeping/boiler_plate'

desc 'Runs all tests if no arguments found'
task :test, :challenge do |t, args|
  system("ruby ./test/test_helper.rb #{args[:challenge]}")
end

desc 'List all completed challenges'
task :list_completed do
  puts Challenge.challenges
end

desc 'Display help'
task :help do
  puts <<-DOC
  Use `noglob rake` instead of `rake` to use rake parameters with square brackets.
  DOC
end

desc "Add new challenge"
task :add, :challenge, :number_of_test_cases do |t, args|
  Challenge.new(
    challenge: args[:challenge],
    number_of_test_cases: args[:number_of_test_cases] || 1
  ).run

  puts "Added file ./lib/#{args[:challenge]}.rb"

  File.open("./lib/#{args[:challenge]}.rb", 'w') do |f|
    f.write BoilerPlate.new(
      template: './house_keeping/boiler_plates/code.txt',
      locals: {camelized: Utilities.camelize(args[:challenge])}
    ).to_s
  end
end

task default: :test
