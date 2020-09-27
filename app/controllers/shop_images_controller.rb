class ShopImagesController < ApplicationController
    before_action :require_user_logged_in
  def index
    @shop = Shop.find(params[:id])
    @image = @shop.shop_images.build
    @images = @shop.shop_images.order(id: :desc).page(params[:page])
  end

  def new
  end

  def create
    @shop = Shop.find(params[:id])
    unless params[:shop_image].blank?
      @image = @shop.shop_images.build(shop_image_params)
      @image.save
      flash[:success] = '写真を投稿しました'
      redirect_to root_url
      else
        redirect_to root_url, alert: "写真の投稿に失敗しました"
    end
  end

  def destroy
  end

  private
  def shop_image_params
    params.require(:shop_image).permit(:image)
  end


end
