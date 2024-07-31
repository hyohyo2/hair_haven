class Public::UsersController < ApplicationController
  # before_action :authenticate_user!

  # マイページ
  def show
  end

  # 会員情報編集
  def edit
    @user = current_user
  end

  # 会員情報の更新処理
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to mypage_path
  end

  # 退会確認画面
  def unsubscribe
  end

  # 退会の処理
  def withdraw

  end

  # いいねした商品一覧
  def favorites
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :post_code, :address, :telephone_number, :email)

  end

end
