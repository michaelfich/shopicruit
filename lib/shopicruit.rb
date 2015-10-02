require 'date'
require 'json'
require 'net/http'

require_relative 'product'

class Shopicruit

  attr_accessor :products, :product_type

  def self.price_of?(product_type=nil)
    shopicruit = new(product_type)
    shopicruit.get_products
    shopicruit.calculate_price
  end

  def initialize(product_type=nil)
    @products = []
    @product_type = product_type
  end

  def query_api
    uri = URI('http://shopicruit.myshopify.com/products.json')
    http_response = Net::HTTP.get(uri)
    JSON.parse(http_response)
  end

  def get_products()
    self.query_api["products"].each do |product|
      if @product_type.nil?
        @products << Product.new(product)
      elsif @product_type.is_a?(String) && product['product_type'] == @product_type
        @products << Product.new(product)
      elsif @product_type.is_a?(Array) && @product_type.include?(product['product_type'])
        @products << Product.new(product)
      end
    end
    @products
  end

  def calculate_price()
    total_price = @products.inject(0) do |sum, product|
      sum += product.variants.inject(0) do |prices, variant|
        prices += variant.price.to_f
      end
    end
    total_price.round(2)
  end

end
