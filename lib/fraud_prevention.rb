class Order
  attr_reader :order_id, :deal_id, :credit_card

  def initialize(row: nil)
    parse(row)
  end

  def scheme_one
    [deal_id, email]
  end

  def scheme_two
    [deal_id, city, state, zip]
  end

  def city
    @city
      .downcase
  end

  def email
    @email
      .downcase
      .gsub(/^.*(?=@.*)/) { |match| match.gsub('.', '') }
      .gsub(/\+.*(?=@.*)/, '')
  end

  def street
    @street
      .downcase
      .gsub(/st\./, 'street')
      .gsub(/rd\./, 'road')
  end

  def state
    @state
      .downcase
      .sub('illinois', 'il')
      .sub('new york', 'ny')
      .sub('california', 'ca')
  end

  def zip
    @zip
      .gsub('-', '')
  end

  private

  def parse(row)
    data = row.strip.split(",")

    @order_id = data[0]
    @deal_id = data[1]
    @email = data[2]
    @street = data[3]
    @city = data[4]
    @state = data[5]
    @zip = data[6]
    @credit_card = data[7]
  end
end

class OrderAnalyzer
  def initialize(source: STDIN)
    @input = source.readlines.drop(1)
  end

  def fraud_orders
    (fraud_scheme(:scheme_one) + fraud_scheme(:scheme_two)).join(',')
  end

  def fraud_scheme(scheme)
    orders
      .group_by(&scheme)
      .map { |_, suspects| suspects.uniq { |s| s.credit_card }.map(&:order_id) }
      .reject { |list| list.count == 1 }
      .flatten
      .sort
      .uniq
  end

  def orders
    @orders ||= @input.map { |order| Order.new(row: order) }
  end
end

# puts OrderAnalyzer.new(source: DATA).fraud_orders

__END__
3
1,1,bUgs+helo@bunny.com,123 Sesame St.,New York,NY,10011,12345689010
2,1,e.lm.er@fudd.com,123 Sesame St.,New York,NY,10011,10987654321
3,2,bugs@bunny.com,123 SesAMe St.,New York,NY,10011,12345689010
