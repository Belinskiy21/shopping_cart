module ShoppingCart
  class Order < ApplicationRecord
    has_many :order_items, dependent: :destroy
    has_many :books, through: :order_items
    belongs_to :user, optional: true
    belongs_to :shipping_method, optional: true
    belongs_to :credit_card, optional: true
    has_one :coupon, dependent: :destroy
    has_many :addresses, dependent: :destroy
    has_one :billing
    has_one :shipping
    include AASM
    attr_accessor :active_admin_requested_event


    scope :in_progress, -> { where(order_state: :in_progress) }
    scope :processing, -> { where(order_state: :processing) }
    scope :in_delivery, -> { where(order_state: :in_delivery) }
    scope :delivered, -> { where(order_state: :delivered) }
    scope :canceled, -> { where(order_state: :canceled) }


    aasm :column => 'order_state',whiny_transitions: false do
      state :in_progress, initial: true
      state :processing
      state :in_delivery
      state :delivered
      state :canceled

      event :completed do
        transitions from: :in_progress, to: :processing
      end

      event :sent_to_client do
        transitions from: :processing, to: :in_delivery
      end

      event :delivered do
        transitions from: :in_delivery, to: :delivered
      end

      event :canceled do
        transitions from: [:processing, :in_delivery], to: :canceled
      end
    end

    def subtotal
      order_items.collect { |item| item.valid? ? (item.quantity * item.book.price ) : 0}.sum
    end

    def empty?
      order_items.empty?
    end

    def total
      subtotal - discount_sum + shipping_price
    end

    def discount_sum
      coupon.nil? ? 0 : subtotal * coupon.discount
    end

    def shipping_price
      shipping_method.nil? ? 0 : shipping_method.price
    end

    def finalize
      self.completed
      self.save!
    end
  end
end
