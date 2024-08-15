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
    review = Review.new(review_params)
    review.item_id = item.id
    review.save
    redirect_to item_reviews_path
  end

  # レビュー一覧
  def index
    item = Item.find(params[:item_id])
    @reviews = item.reviews.all
  end

  # レビュー投稿内容確認
  def confirm

  end

  private

  def review_params
    params.require(:review).permit(:title, :detail)
  end

end
