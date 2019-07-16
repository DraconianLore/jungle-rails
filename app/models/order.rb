# frozen_string_literal: true

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create do
    line_items.each do |item|
      product = Product.find(item.product_id)
      product.quantity -= item.quantity
      product.save!
    end
  end
end
