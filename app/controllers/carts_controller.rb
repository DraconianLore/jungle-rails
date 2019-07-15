class CartsController < ApplicationController
  before_filter :authorize
  def show
    if cart.length < 1
      flash.now[:notice] = "Cart is empty"
    end
    
    enhanced_cart.each do |item|
      product = item[:product]
      if product.quantity - item[:quantity] < 0
        flash.now[:error] = "There are only #{product.quantity} left of #{product.name}, you can not purchase #{item[:quantity]} of them."
      end
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
