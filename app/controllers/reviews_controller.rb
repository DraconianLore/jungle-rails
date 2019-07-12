class ReviewsController < ApplicationController

    def create
        @review = Review.new
        @review.user = current_user
        @review.product = Product.find(params[:product_id])
        @review.rating = params[:rating]
        @review.description = params[:description]
        if @review.valid?
            @review.save
        end
        redirect_to @review.product 

       
    end
  
  end
  