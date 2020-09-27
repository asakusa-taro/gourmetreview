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
        @images = @shop.shop_images.order(id: :desc).page(params[:page])
        flash.now[:danger] = '写真の投稿に失敗しました'
        # redirect_to root_url, alert: "写真の投稿に失敗しました"
        render :index
    end
  end

  def destroy
    # @image.destroy
    # flash[:success] = 'メッセージを削除しました。'
    # redirect_back(fallback_location: root_path)
  end

  private
  def shop_image_params
    params.require(:shop_image).permit(:image)
  end


end
