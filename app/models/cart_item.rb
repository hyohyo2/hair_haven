class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :user
  
  validates :amount, presence: :true

end
