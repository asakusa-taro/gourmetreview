class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :update]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    # @shops = Shop.find(params[:id])
    @fav_shops = @user.fav_shops.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(user_params)
    @user.image = "NoImage.jpg"

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
  
  def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end
  
  # def likes
  #   @user = User.find(params[:id])
  #   @shops = Shop.find(params[:id])
  #   @fav_shops = @user.fav_shops.order(id: :desc).page(params[:page])
  # end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :image)
  end
  
  
end
