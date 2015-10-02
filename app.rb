require_relative 'lib/shopicruit'

price = Shopicruit.price_of? ["Wallet", "Lamp"]

puts "The total price of all Wallets and Lamps in the Shopicruit store is $#{price}"
