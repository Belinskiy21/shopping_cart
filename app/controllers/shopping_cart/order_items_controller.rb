require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :set_current_order

    def create
      @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
      if @order_item
        @order_item.update_attribute(:quantity, @order_item.quantity + params[:order_item][:quantity].to_i)
      else
        @order_item = @order.order_items.new(order_items_params)
        @order.user = current_user if user_signed_in?
        @order.save
      end
      session[:order_id] = @order.id
      respond_to do |format|
        format.html do
        end
        format.js
      end
      redirect_back fallback_location: main_app.product_path(params[:order_item][:product_id]), notice: 'Product was added to you order!'
    end

    def destroy
      @order_items = @order.order_items
      @order_items.find(params[:id]).destroy
      redirect_to cart_path, notice: 'Item was deleted!'
    end

    def update
      @order_item = @order.order_items.find(params[:id])
      @order_item.update_attribute(:quantity, params[:quantity].to_i )
      @order.save
      respond_to do |format|
        format.js
        redirect_to cart_path, notice: 'Cart was updated!'
      end
    end

    private

    def order_items_params
      params.require(:order_item).permit(:product_id, :quantity)
    end

    def set_current_order
      @order = current_order
    end
  end
end
