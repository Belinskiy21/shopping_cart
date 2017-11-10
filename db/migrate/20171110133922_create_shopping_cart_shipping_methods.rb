class CreateShoppingCartShippingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_shipping_methods do |t|
      t.string :name
      t.integer :min_days
      t.integer :max_days

      t.timestamps
    end
  end
end
