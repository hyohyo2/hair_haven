class Review < ApplicationRecord

  belongs_to :item
  belongs_to :user

  validates :title, presence: true
  validates :detail, presence: true
  validates :star, presence: true

end
