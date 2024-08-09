class Item < ApplicationRecord

  enum kind: { female_wig: 0, male_wig: 1, accessory: 2 }
  enum size: { double_small: 0, small: 1, medium: 2, large: 3, double_large: 4, not_size: 5 }
  enum length: { short_hair: 0, bob_hair: 1, medium_hair: 2, long_hair: 3, not_length: 4 }

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  has_one_attached :image

  validates :name, presence: true
  validates :kind, presence: true
  # validates :size
  # validates :length
  # validates :color
  #
  validates :detail, presence: true, length: { maximum: 150 }
  validates :price, presence: true
  validates :is_active, presence: true, inclusion: { in: [true, false] }
  
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

end
