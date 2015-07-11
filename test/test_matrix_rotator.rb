require_relative './test_helper'
require 'matrix_rotator'

class TestMatrixRotator < Minitest::Test
  FIXTURES = "./test/fixtures/matrix_rotators/"

  def self.sample_set
    @sample_set ||= Dir
      .glob(FIXTURES + '*')
      .grep(/_input/)
      .map { |f| f[/\d\d/] }
  end

  @sample_set = self.sample_set

  @sample_set.each do |sample|
    define_method("test_sample_#{sample}") do
      assert_equal(
        open(sample, 'output').read.strip,
        MatrixRotator.new(source: open(sample, 'input')).result
      )
    end
  end

  def open(sample, type)
    File.open("#{FIXTURES}#{sample}_#{type}.txt", 'r')
  end
end
