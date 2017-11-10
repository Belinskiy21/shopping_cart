class CreateShoppingCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_orders do |t|
      t.integer :user_id
      t.integer :shipping_method_id
      t.string :order_state
      t.integer :credit_card_id

      t.timestamps
    end
    add_index :shopping_cart_orders, :user_id
    add_index :shopping_cart_orders, :shipping_method_id
    add_index :shopping_cart_orders, :credit_card_id
  end
end
