class Cart
  attr_reader :contents
  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def remove_item(item_id)
    contents.delete(item_id.to_s)
  end

  def update_quantity(item_id, quantity)
    contents[item_id.to_s] = quantity.to_i
  end

  def total
    obj_contents.inject(0) do |total, cart_item|
      total += cart_item[0].price * cart_item[1]
    end
  end

  def obj_contents
    contents.inject({}) do |hash, array|
      hash[Item.find(array[0].to_i)] = array[1]
      hash
    end
  end
end
