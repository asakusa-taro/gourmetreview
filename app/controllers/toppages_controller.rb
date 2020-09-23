class ToppagesController < ApplicationController
  def index
    if logged_in?
      # @shop = current_user.shops.build #form_with用
      @shops = Shop.order(id: :desc).page(params[:page])
      
    end
  end
end
