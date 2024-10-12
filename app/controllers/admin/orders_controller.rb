class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  # 注文詳細
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id )
  end

  # 注文データ更新処理
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "comfirmed_payment"
      @order_details.update_all(making_status: 1)
    end
    redirect_to admin_order_path(@order)
  end
  

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
