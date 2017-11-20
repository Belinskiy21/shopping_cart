FactoryBot.define do
  factory :shipping_method, class: 'ShoppingCart::ShippingMethod' do
    name { %w[ususal air].sample }
    price 10.0
    max_days '10'
    min_days '3'
  end
end
