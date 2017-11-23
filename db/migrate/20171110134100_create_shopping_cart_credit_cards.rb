class CreateShoppingCartCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.string :number
      t.string :name
      t.string :cvv
      t.string :mm_yy
      t.integer :user_id

      t.timestamps
    end
    add_index :shopping_cart_credit_cards, :user_id
  end
end
