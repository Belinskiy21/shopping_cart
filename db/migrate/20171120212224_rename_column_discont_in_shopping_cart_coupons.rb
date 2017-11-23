class RenameColumnDiscontInShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    rename_column :shopping_cart_coupons, :discont, :discount 
  end
end
