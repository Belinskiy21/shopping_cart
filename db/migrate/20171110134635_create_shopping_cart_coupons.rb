class CreateShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.decimal :discont, precision: 3, scale: 2
      t.integer :order_id

      t.timestamps
    end
    add_index :shopping_cart_coupons, :order_id
  end
end
