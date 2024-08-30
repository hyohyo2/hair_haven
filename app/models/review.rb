class Review < ApplicationRecord

  belongs_to :user
  belongs_to :item
  
  validates :title, presence: true
  validates :detail, presence: true
  validates :star, presence: true

end
