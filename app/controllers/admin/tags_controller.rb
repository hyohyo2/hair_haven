class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  # タグ登録フォーム/一覧
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  # タグデータ登録処理
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "タグを登録しました。"
      redirect_to admin_tags_path
    else
      flash.now[:alert] = "タグの登録に失敗しました。"
      @tags = Tag.all
      render :index
    end
  end

  # タグ編集フォーム
  def edit
    @tag = Tag.find(params[:id])
  end

  # タグデータ更新処理
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "タグ名の変更をしました。"
      redirect_to admin_tags_path
    else
      flash.now[:alert] = "タグ名の変更に失敗しました。"
      render :edit
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end


end
