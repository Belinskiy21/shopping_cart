require 'rails_helper'
module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller do
    let!(:user) { FactoryBot.create(:user) }
    let!(:order) { FactoryBot.create(:order, :with_order_item, user_id: user.id) }
    let(:product) { FactoryBot.create(:product) }
    before { sign_in(user) }

    describe 'POST #create' do
      let(:create_params) { { order_item: { book_id: book.id, quantity: 1 } } }
      before { post :create, xhr: true,  params: create_params }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assign @order_item'  do
        expect(:order_item).not_to be_nil
      end
    end
  end
end
