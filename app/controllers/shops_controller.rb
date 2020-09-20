class ShopsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :create]
  before_action :correct_user, only: [:destroy]

  def new
    @shop = current_user.shops.build
  end
  
  def show
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      flash[:success] = 'お店を投稿をしました'
      redirect_to root_url
    else
      @shop = current_user.shops.build(shop_params)
      flash.now[:danger] = 'お店の投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @shop.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :content, :business_hours, :address, :hp)
  end
  
  def correct_user
    @shop = current_user.shop.find_by(id: params[:id])
    unless @shop
      redirect_to root_url
    end
  end  
  
end
