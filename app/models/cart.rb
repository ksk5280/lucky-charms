class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def item_count
    contents.values.sum
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def fetch_items
    contents.map do |item_id, quantity|
      [Item.find(item_id.to_i), quantity]
    end
  end

  def total
    total = fetch_items.inject(0) do |acc, elem|
      acc + (elem[0].price * elem[1])
    end
    "#{format('$%.2f', (total.to_f / 100))}"
  end
end
