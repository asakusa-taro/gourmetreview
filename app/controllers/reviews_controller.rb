class ReviewsController < ApplicationController
  
  def new
    @review = current_user.reviews.new
    @shop = Shop.find(params[:shop_id])
  end
  
  def create
    @review = current_user.reviews.new(review_params)
    shop = Shop.find(params[:shop_id])
    @review.shop_id = shop.id

    if @review.save
      flash[:success] = '口コミを投稿をしました'
       redirect_to root_url
    else
      @review = current_user.reviews.build(review_params)
      flash.now[:danger] = '口コミの投稿に失敗しました'
      # render 'shops/show'
    end
  end

  def destroy
  end

  private
  
  def review_params
    params.require(:review).permit(:user_id, :shop_id, :review)
  end

end
