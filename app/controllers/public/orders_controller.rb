class Public::OrdersController < ApplicationController
  # before_action :authenticate_user!

  # 注文情報入力
  def new
    @order = Order.new
  end

  # 注文情報確認
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_user.post_code
      @order.address = current_user.address
      @order.name = current_user.full_name
    elsif params[:order][:select_address] == "1"
      select = Address.find(params[:order][:address_id])
      @order.post_code = select.post_code
      @order.address = select.address
      @order.name = select.name
    elsif params[:order][:select_address] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end
    @cart_items = current_user.cart_items.all
    # カラムのshipping_costとモデルに定義したget_shipping_costの値を同じにする
    @order.shipping_cost = @order.get_shipping_cost
  end

  # 注文確定処理
  def create
    

  end

  # 注文完了画面
  def thanks
  end

  # 注文履歴
  def index
  end

  # 注文履歴詳細
  def show
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :post_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end


end
