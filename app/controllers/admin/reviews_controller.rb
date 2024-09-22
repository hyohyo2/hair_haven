class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  # レビュー一覧
  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.all

  end

  # レビューデータ削除処理
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_item_reviews_path
  end
end
