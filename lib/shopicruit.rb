require 'json'
require 'net/http'

require_relative 'product'

class Shopicruit

  attr_accessor :address, :products

  def initialize(address=nil)
    @address = address || 'http://shopicruit.myshopify.com/products.json'
    @products = self.get_products
  end

  def query_api
    uri = URI(@address)
    JSON.parse(Net::HTTP.get(uri))
  end

  def get_products(product_type=nil)
    response = self.query_api

    response["products"].inject([]) do |products, product|
      if product.nil?
        products << Product.new(product)
      elsif product_type.class == String && product['product_type'] == product_type
        products << Product.new(product)
      elsif product_type.class == Array && product_type.include?(product['product_type'])
        products << Product.new(product)
      end

      products
    end
  end

  def get_total_price(product_types=nil)
    products = self.get_products(product_types)

    total_price = products.inject(0) do |sum, product|
      sum = product.variants.inject(sum) do |prices, variant|
        prices += variant.price.to_f
      end
    end

    total_price.round(2)
  end

end
