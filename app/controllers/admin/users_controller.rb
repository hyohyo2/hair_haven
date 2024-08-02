class Admin::UsersController < ApplicationController
  # before_action :authenticate_admin!

  # 会員一覧
  def index
    @users = User.all
  end

  # 会員詳細
  def show
  end

  # 会員データ編集フォーム
  def edit
  end

  # 会員データ更新処理
  def update
  end

end
