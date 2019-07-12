class ReviewsController < ApplicationController
    before_filter :authorize
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
  
    def destroy
        puts params
        @review = Review.find(params[:id])
        puts @review
        @review.destroy
        redirect_to product_url(params[:product_id]) , notice: 'Review deleted!'
      end
  end
  