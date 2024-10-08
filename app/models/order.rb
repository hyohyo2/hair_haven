class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { waiting_for_payment: 0, comfirmed_payment: 1, in_production: 2, preparing_for_shipping: 3, shipped: 4 }

  belongs_to :user
  has_many :order_details, dependent: :destroy

  # 郵便番号の正規表現
  POST_CODE = /\A\d{3}[-]\d{4}\z/
  SHIPPING_COST = 800
  TAX = 1.1

  validates :user_id, presence: true
  validates :post_code, presence: true, format: { with: POST_CODE }
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true



  def get_shipping_cost
    (SHIPPING_COST * TAX).floor
  end
  
  def get_tax
    TAX
  end

  # 注文個数の合計
  def get_total_amount
    total_amount = 0
    order_details.each do |order_detail|
      total_amount += order_detail.amount
    end
    total_amount
  end

  # 商品金額合計
  def get_total_price
    total_price = 0
    order_details.each do |order_detail|
      total_price += order_detail.subtotal
    end
    total_price
  end

  # 消費税額のみ(請求金額-(請求金額/消費税))
  def get_only_tax
    (get_billed_amount - (get_billed_amount / TAX)).floor
  end

  # 請求金額
  def get_billed_amount
    get_total_price + get_shipping_cost
  end
  
  def get_cartitem_total_price
    total_price = 0
    cartitems.each do |cart_item|
      total_price += cart_item.subtotal
    end
    total_price
  end

end
