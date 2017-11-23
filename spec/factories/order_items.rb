FactoryBot.define do
  factory :order_item, class: 'ShoppingCart::OrderItem' do
    transient do
      product
    end
    order
    unit_price 1.0
    quantity 1
    total_price 1.0

    factory :order_item_best_sellers do
      before(:create) do |order_item, evaluator|
        order_item.product= evaluator.product if evaluator.product
        order_item.order= FactoryBot.create(:order)
      end
    end
  end
end
