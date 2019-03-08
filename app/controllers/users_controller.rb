class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def show
    @user = User.find(params[:id])
  end

  def new
    # Sign up画面（ユーザー登録画面）
    @user = User.new
  end

  def create
    # ユーザー登録そのもの
    @user = User.new(user_params)
    
    if @user.save
      # ユーザー登録に成功したとき、UsersControllerのshowに飛ぶ
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      # ユーザー登録に失敗したとき、views/users/new.html.erbを表示している
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
