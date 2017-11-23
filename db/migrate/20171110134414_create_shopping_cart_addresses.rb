class CreateShoppingCartAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :countryphone
      t.string :type
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
    add_index :shopping_cart_addresses, :user_id
    add_index :shopping_cart_addresses, :order_id
  end
end
