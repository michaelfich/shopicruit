class Image

  attr_accessor :id, :created_at, :position, :updated_at, :product_id,
    :variant_ids, :src

  def initialize(params)
    @id = params['id'] if params['id']
    @created_at = DateTime.parse(params['created_at']) if params['created_at']
    @position = params['position'] if params['position']
    @updated_at = DateTime.parse(params['updated_at']) if params['updated_at']
    @product_id = params['product_id'] if params['product_id']
    @variant_ids = params['variant_ids'].to_a if params['variant_ids']
    @src = params['src'] if params['src']
  end

end