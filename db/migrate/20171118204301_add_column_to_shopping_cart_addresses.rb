class AddColumnToShoppingCartAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_cart_addresses, :phone, :string
  end
end
