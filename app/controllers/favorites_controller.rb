class FavoritesController < ApplicationController
  def create
    shop = Shop.find(params[:favorite_id])
    current_user.favorite(shop)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to root_url    
  end

  def destroy
    shop = Shop.find(params[:favorite_id])
    current_user.unfavorite(shop)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url    
  end
end
