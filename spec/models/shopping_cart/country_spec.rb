require 'rails_helper'
module ShoppingCart

  RSpec.describe Country, type: :model do
    context 'validations' do
      it { should validate_presence_of :name }
    end
  end
end
