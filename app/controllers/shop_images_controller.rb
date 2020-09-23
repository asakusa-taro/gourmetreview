class ShopImagesController < ApplicationController
  def index
    @shop = Shop.find(params[:id])
    @image = @shop.shop_images.build
    @images = @shop.shop_images.order(id: :desc).page(params[:page])
  end

  def new
  end

  def create
    @shop = Shop.find(params[:id])
    @image = @shop.shop_images.new(shop_image_params)
    if @image.save
      flash[:success] = '写真を投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = '写真の投稿に失敗しました'
    end
  end

  def destroy
  end

  private
  def shop_image_params
    params.require(:shop_image).permit(:shop_id, :image)
  end


end
