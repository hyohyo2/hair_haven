class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # レビュー投稿フォーム
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  # レビュー登録処理
  def create
    item = Item.find(params[:item_id])
    review = current_user.reviews.new(review_params)
    review.item_id = item.id
    if review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to item_reviews_path
    else
      flash[:alert] = "レビュー投稿に失敗しました。"
      @item = Item.find(params[:item_id])
      @review = Review.new
      render :new
    end
  end

  # レビュー一覧
  def index
    @item = Item.find(params[:item_id])
    @review = @item.reviews.all
  end

  # レビュー投稿内容確認
  def confirm

  end

  # レビューの削除
  def destroy
    Review.find(params[:id]).destroy
    redirect_to item_reviews_path(params[:item_id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :detail, :star)
  end

end
