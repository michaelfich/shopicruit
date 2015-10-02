class Variant

  attr_accessor :id, :title, :option1, :option2, :option3, :price, :grams,
    :compare_at_price, :sku, :requires_shipping, :taxable, :position, :product_id,
    :created_at, :updated_at, :available, :featured_image

  def initialize(params)
    @id = params['id'] if params['id']
    @title = params['title'] if params['title']
    @option1 = params['option1'] if params['option1']
    @option2 = params['option2'] if params['option2']
    @option3 = params['option3'] if params['option3']
    @price = params['price'] if params['price']
    @grams = params['grams'] if params['grams']
    @compare_at_price = params['compare_at_price'] if params['compare_at_price']
    @sku = params['sku'] if params['sku']
    @requires_shipping = params['requires_shipping'] if params['requires_shipping']
    @taxable = params['taxable'] if params['taxable']
    @position = params['position'] if params['position']
    @product_id = params['product_id'] if params['product_id']
    @created_at = params['created_at'] if params['created_at']
    @updated_at = params['updated_at'] if params['updated_at']
    @available = params['available'] if params['available']
    @featured_image = params['featured_image'] if params['featured_image']
  end

end