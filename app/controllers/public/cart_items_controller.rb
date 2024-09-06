class Public::CartItemsController < ApplicationController
  before_action :authenticate_user!

  # カート内商品一覧
  def index
    @cart_items = current_user.cart_items.all
  end

  # カート内商品データ登録処理
  def create
    # カート商品を登録
    @cart_item = current_user.cart_items.new(cart_items_params)
    # もし同じ商品が元々ある場合
    if current_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?

      # ログインユーザーのカートアイテムの中にitem_idと追加されたitem_idの一致を見つけたら、
      cart_item = current_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # cart_item.amountに追加した:cart_itemと:amountを加える
      cart_item.amount +=params[:cart_item][:amount].to_i
      cart_item.save
      flash[:notice] = "商品をかごに入れました。"
      redirect_to cart_items_path
    # もしデータを保存できたら
    elsif @cart_item.save
      @cart_items = current_user.cart_items.all
    else #もし保存できなかったら
      flash.now[:alert] = "商品をかごに入れるのを失敗しました。"
      render :index
    end

  end

  # カート内商品データ更新処理
  def update

  end

  # カート内商品データ削除処理(一部商品)
  def destroy

  end

  # カート内商品データ削除処理(全商品)
  def destroy_all

  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:user_id, :item_id, :amount)
  end

end
