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

  def total
    contents.values.sum
  end

  def obj_contents
    contents.inject({}) do |hash, array|
      hash[Item.find(array[0].to_i)] = array[1]
      hash
    end
  end
end
