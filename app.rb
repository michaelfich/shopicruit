require_relative 'lib/shopicruit'

puts Shopicruit.price_of?
puts Shopicruit.price_of? "Wallet"
puts Shopicruit.price_of? ["Wallet", "Lamp"]
