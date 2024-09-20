class Public::OrdersController < ApplicationController
  before_action :authenticate_user!

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
      selected = Address.find(params[:order][:address_id])
      @order.post_code = selected.post_code
      @order.address = selected.address
      @order.name = selected.name

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
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    # 注文履歴(order_detail)へ保存
    current_user.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    current_user.cart_items.destroy_all
    redirect_to thanks_path
  end

  # 注文完了画面
  def thanks
  end

  # 注文履歴
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # 注文履歴詳細
  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :post_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
  end


end
