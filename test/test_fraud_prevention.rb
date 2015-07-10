require_relative './test_helper'
require 'fraud_prevention'

class TestOrderAnalyzer < Minitest::Test
  def setup
    @given_output = '1,2'
  end

  def test_given
    assert_equal @given_output, OrderAnalyzer.new.fraud_orders
  end
end

__END__
3
1,1,bUgs+helo@bunny.com,123 Sesame St.,New York,NY,100-11,12345689010
2,1,e.lm.er@fudd.com,123 Sesame St.,New York,NY,10-011,10987654321
3,2,b.ugs@bunny.com,123 SesAMe rd.,New York,NY,1--0011,12345689010
3,22,b.ugs@bunny.com,123 SesAMe rd.,New York,CalifoRnia,1--0011,12345689010
3,32,b.ugs@bunny.com,123 SesAMe rd.,New York,Illinois,1--0011,12345689010
