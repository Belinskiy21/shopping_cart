class RenameColumnCountryphoneInAddresses < ActiveRecord::Migration[5.1]
  def change
    rename_column :shopping_cart_addresses, :countryphone, :country
  end
end
