class Admin::UsersController < ApplicationController
  # before_action :authenticate_admin!

  # 会員一覧
  def index
    @users = User.all
  end

  # 会員詳細
  def show
    @user = User.find(params[:id])
  end

  # 会員データ編集フォーム
  def edit
    @user = User.find(params[:id])
  end

  # 会員データ更新処理
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to admin_user_path
    else
      flash[:alert] = "会員情報の更新に失敗しました。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :post_code, :address, :telephone_number, :email, :is_active)
  end

end
