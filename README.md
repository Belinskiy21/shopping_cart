# ShoppingCart
This is engine for any commerce application with goods basket and checkout process. 

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'shopping_cart'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install shopping_cart
```
then do:
- Add dependencies to your User and Products model.
- if your not using Devise you should override current_user method.
- Add file shopping_cart.rb in your initializer folder and configurate your User and Product like this:
ShoppingCart.product_class = 'Product'
ShoppingCart.user_class = 'User'
- add shipping methods to shopping_cart_shipping_methods table in db.
## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
