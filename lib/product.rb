require 'date'

require_relative 'variant'
require_relative 'image'
require_relative 'options'

class Product

  attr_accessor :id, :title, :handle, :body_html, :published_at, :created_at,
    :updated_at, :vendor, :product_type, :tags, :variants, :images, :options

  def initialize(params)
    @id = params['id']
    @title = params["title"]
    @handle = params['handle']
    @body_html = params['body_html']
    @published_at = DateTime.parse(params['published_at'])
    @created_at = DateTime.parse(params['created_at'])
    @updated_at = DateTime.parse(params['updated_at'])
    @vendor = params['vendor']
    @product_type = params['product_type']
    @tags = params['tags']
    @variants = params["variants"].map { |variant| Variant.new(variant) }
    @images = params['images'].map { |image| Image.new(image) }
    @options = params['options'].map { |option| Option.new(option) }
  end


end