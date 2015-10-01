require_relative '../lib/shopicruit'

describe 'Shopify API' do
  before(:context) do
    @shopicruit = Shopicruit.new
  end

  it '#query_api gets a products hash' do
    json = @shopicruit.query_api()
    expect(json).to be_a(Hash)
  end

  it '#get_products accepts a single product type as a string' do
    products = @shopicruit.get_products('Wallet')
    expect(products).to be_an_instance_of(Array)
  end

  it '#get_products accepts an array of product types' do
    products = @shopicruit.get_products(['Wallet', 'Lamp'])
    expect(products).to be_an_instance_of(Array)
  end

  it '#get_products returns all products if no criteria for filtering is given' do
    products = @shopicruit.get_products()
    expect(products).to be_an_instance_of(Array)
  end

  it '#get_total_price gets a float value' do
    total_price = @shopicruit.get_total_price
    expect(total_price).to be_an_instance_of(Float)
  end
end