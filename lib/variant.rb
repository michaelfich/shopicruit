class Variant

  attr_accessor :id, :title, :option1, :option2, :option3, :price, :grams,
    :compare_at_price, :sku, :requires_shipping, :taxable, :position, :product_id,
    :created_at, :updated_at, :available, :featured_image

  def initialize(params)
    @title = params["title"]
    @price = params["price"]
  end

end