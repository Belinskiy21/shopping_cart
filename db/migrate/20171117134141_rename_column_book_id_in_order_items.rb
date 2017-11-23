class RenameColumnBookIdInOrderItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :shopping_cart_order_items, :book_id, :product_id
  end
end
