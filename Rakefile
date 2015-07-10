desc 'Run all tests'
task :test do
  Dir.glob('./test/test_*').each do |test_file|
    system("ruby #{test_file}")
  end
end

task default: :test
