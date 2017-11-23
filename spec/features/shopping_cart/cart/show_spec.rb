require 'rails_helper'

module ShoppingCart
  RSpec.feature 'Visiting Cart', type: :feature do
    before do
      @order = FactoryBot.create(:order)
      visit shopping_cart.root_path(@order)
    end

    describe 'body' do
      subject { page.find('body') }
      it { expect(subject).to have_content 'Cart' }
      it { expect(subject).to have_selector :link_or_button, 'Checkout'}
      it { expect(subject).to have_selector :link_or_button, 'Update cart' }
      it { expect(subject).to have_content 'Order Summary' }
      it { expect(subject).to have_content I18n.t('subtotal') }
      it { expect(subject).to have_content I18n.t('coupon') }
      it { expect(subject).to have_content I18n.t('total') }
      it { expect(subject).to have_content I18n.t('quantity') }
    end
  end
end
