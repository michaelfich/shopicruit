# Shopicruit

## Task

You've discovered the Shopify Store 'Shopicruit'. Since you're obsessed with lamps and wallets, you want to buy every single lamp and wallet variant they have to offer. By inspecting the Javascript calls on the store you discovered that the shop lists products at http://shopicruit.myshopify.com/products.json. Write a program that calculates how much all lamps and wallets would cost you. Attach your program (any language) and answer in your reply.

## How to use

Call the class method #price_of? on the class Shopicruit.  This returns a variable which contains a Float value representing the price of all of the products returned from the Shopicruit API which are of the product type requested.

The parameter can contain three types of values.  If sent no parameter, or a `nil` value, the price of all products will be returned.

```
Shopicruit.price_of?
```

If sent a single string parameter, the sum of the price of all variants of the product type specified will be returned.

```
Shopicruit.price_of? 'Wallet'
```

If an array of strings are sent as a parameter, the sum of the price of all variants of product types specified is returned.

```
Shopicruit.price_of? ['Wallet', 'Lamp']
```