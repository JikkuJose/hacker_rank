require_relative './test_helper'
require 'encryption'

class TestEncryption < Minitest::Test
  FIXTURE = './test/fixtures/encryption/samples.yml'

  @samples = YAML::load File.open(FIXTURE, 'r').read

  @samples.each_with_index do |(message, cipher), index|
    define_method("test_sample_#{index}") do
      assert_equal cipher, Encryptor.new(message: message).cipher
    end
  end
end
