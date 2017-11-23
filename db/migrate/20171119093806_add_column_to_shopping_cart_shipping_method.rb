class AddColumnToShoppingCartShippingMethod < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_cart_shipping_methods, :price, :decimal
  end
end
