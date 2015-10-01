require_relative 'lib/shopicruit'

shopicruit = Shopicruit.new
puts shopicruit.get_total_price(["Wallet", "Lamp"])
