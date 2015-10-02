require 'date'

require_relative 'variant'
require_relative 'image'
require_relative 'options'

class Product

  attr_accessor :id, :title, :handle, :body_html, :published_at, :created_at,
    :updated_at, :vendor, :product_type, :tags, :variants, :images, :options

  def initialize(params)
    @id = params['id'] if params['id']
    @title = params["title"] if params["title"]
    @handle = params['handle'] if params['handle']
    @body_html = params['body_html'] if params['body_html']
    @published_at = DateTime.parse(params['published_at']) if params['published_at']
    @created_at = DateTime.parse(params['created_at']) if params['created_at']
    @updated_at = DateTime.parse(params['updated_at']) if params['updated_at']
    @vendor = params['vendor'] if params['vendor']
    @product_type = params['product_type'] if params['product_type']
    @tags = params['tags'] if params['tags']
    @variants = params["variants"].map { |variant| Variant.new(variant) } if params["variants"]
    @images = params['images'].map { |image| Image.new(image) } if params['images']
    @options = params['options'].map { |option| Option.new(option) } if params['options']
  end

end