require 'yaml'

desc 'Runs all tests if no arguments found'
task :test, :challenge do |t, args|
  system("ruby ./test/test_helper.rb #{args[:challenge]}")
end

desc 'List all completed challenges'
task :list_completed do
  puts YAML::load(File.open("./challenges.yml", 'r').read)
end

desc 'Display help'
task :help do
  heredoc = <<-DOC
  Use `noglob rake` instead of `rake` to use rake parameters with square brackets.
  DOC

  puts heredoc
end

task default: :test
