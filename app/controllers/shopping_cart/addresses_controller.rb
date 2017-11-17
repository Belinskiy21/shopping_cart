require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class AddressesController < ApplicationController
    def index
      @addresses = ShoppingCart::AddressesForm.new(user_id: current_user.id)
    end

    def create
      @addresses = ShoppingCart::AddressesForm.new(addresses_params)
      render :index, object: @addresses.errors
    end

    def edit
      @addresses = ShoppingCart:AddressesForm.new(user_id: current_user.id)
    end

    def update
      @addresses = ShoppingCart::AddressesForm.new(addresses_params)
      redirect_to edit_user_registration_path, notice: 'Addresses was updated!' if @addresses.save
      redirect_to 'new' unless @addresses.save
    end

    private

    def addresses_params
      params.require(:addresses_form)
    end
  end
end
