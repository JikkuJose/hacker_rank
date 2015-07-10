class Order
  attr_reader :credit_card

  def initialize(row: nil)
    parse(row)
  end

  def scheme_one
    [deal_id, email]
  end

  def scheme_two
    [deal_id, city, state, zip]
  end

  def order_id
    @order_id.to_i
  end

  def deal_id
    @deal_id.to_i
  end

  def city
    @city.downcase
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
    @zip.gsub('-', '')
  end

  private

  def parse(row)
    @order_id,
      @deal_id,
      @email,
      @street,
      @city,
      @state,
      @zip,
      @credit_card = row.strip.split(',')
  end
end

class OrderAnalyzer
  def initialize(source: DATA)
    @input = source.readlines.drop(1)
  end

  def fraud_orders
    (fraud_scheme(:scheme_one) + fraud_scheme(:scheme_two))
      .sort
      .uniq
      .join(',')
  end

  private

  def fraud_scheme(scheme)
    orders
      .group_by(&scheme)
      .map { |_, suspects| suspects.map(&:order_id) }
      .reject { |orders| orders.count == 1 }
      .flatten
  end

  def orders
    @orders ||= @input.map { |line| Order.new(row: line) }
  end
end

# puts OrderAnalyzer.new(source: STDIN).fraud_orders
