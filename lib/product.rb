require_relative 'variant'

class Product

  attr_accessor :id, :title, :handle, :body_html, :published_at, :created_at,
    :updated_at, :vendor, :product_type, :tags, :variants, :images, :options

  def initialize(product_params)
    @title = product_params["title"]
    @variants = product_params["variants"].inject([]) do |variants, variant|
      variants << Variant.new(variant)
    end
  end

end