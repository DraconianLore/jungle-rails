# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do


  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product1 = cat1.products.create!(name: 'Sweedish penis enlarger', description: 'you know you want one!', category: cat1, price_cents: 9000, quantity: 12)
      @product2 = cat1.products.create!(name: 'Dog box bedroom', description: 'For when the wife is not happy with you', category: cat1, price_cents: 250_000, quantity: 3)
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: 'test@test.test', stripe_charge_id: 1, total_cents: 200)
      # 2. build line items on @order
      @order.line_items.new(product: @product1, quantity: 1, item_price_cents: 100, total_price_cents: 100)
      # @order.line_items.new(product: @product2, quantity: 2, item_price_cents: 100, total_price_cents: 100)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq 11
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(email: 'test@test.test', stripe_charge_id: 1, total_cents: 200)
      @order.line_items.new(product: @product1, quantity: 1, item_price_cents: 100, total_price_cents: 100)
      # @order.line_items.new(product: @product2, quantity: 2, item_price_cents: 100, total_price_cents: 100)
      @order.save!
      @product1.reload
      @product2.reload
      expect(@product2.quantity).to eq 3
    end
  end
end
