class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_items do |t|
      t.integer :order_id
      t.integer :book_id
      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :total_price, precision: 8, scale: 2
      t.integer :quantity

      t.timestamps
    end
    add_index :shopping_cart_order_items, :order_id
    add_index :shopping_cart_order_items, :book_id
  end
end
