class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :user
  
  validates :amount, presence: :true
  
  def subtotal
    amount * item.add_tax_price
  end
  
end
