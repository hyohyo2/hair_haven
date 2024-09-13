class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { waiting_for_payment: 0, comfirmed_payment: 1, in_production: 2, preparing_for_shipping: 3, shipped: 4 }

  belongs_to :user
  has_many :order_details, dependent: :destroy
  
  # 郵便番号の正規表現
  POST_CODE = /\A\d{3}[-]\d{4}\z/
  
  validates :user_id, presence: true
  validates :post_code, presence: true, format: { with: POST_CODE }
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
end
