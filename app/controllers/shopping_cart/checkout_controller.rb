require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class CheckoutController < ApplicationController
    include Wicked::Wizard
    include Showable
    include Updatable

    steps :addresses, :delivery, :payment, :confirm, :complete

    def show
      @current_order = current_order
      return redirect_to root_path, notice: I18n.t('no_items') if no_items_in_cart?
      send("show_#{step}") unless step == 'wicked_finish'
      render_wizard
    end

    def update
      @current_order = current_order
      send("update_#{step}")
      redirect_to next_wizard_path unless performed?
    end

    private

    def no_items_in_cart?
      current_order.order_items.empty? && step != :complete
    end
  end
end
