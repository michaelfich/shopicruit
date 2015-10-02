require 'date'
require 'json'
require 'net/http'

require_relative 'product'

class Shopicruit

  attr_accessor :products, :query

  def self.price_of?(query=nil)
    shopicruit = new(query)
    shopicruit.get_products
    shopicruit.calculate_price
  end

  def initialize(query=nil)
    @products = []
    @query = query
  end

  def query_api
    uri = URI('http://shopicruit.myshopify.com/products.json')
    http_response = Net::HTTP.get(uri)
    JSON.parse(http_response)
  end

  def get_products()
    self.query_api["products"].each do |product|
      if @query.nil?
        @products << Product.new(product)
      elsif @query.is_a?(String) && product['product_type'] == @query
        @products << Product.new(product)
      elsif @query.is_a?(Array) && @query.include?(product['product_type'])
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
