class Item < ApplicationRecord

  enum kind: { female_wig: 0, male_wig: 1, accessory: 2 }
  enum size: { double_small: 0, small: 1, medium: 2, large: 3, double_large: 4, not_size: 5 }
  enum length: { short_hair: 0, bob_hair: 1, medium_hair: 2, long_hair: 3, not_length: 4 }

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  # validates :size
  # validates :length
  # validates :color
  #
  validates :detail, presence: true, length: { maximum: 150 }
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true,false] }

  # 消費税率
  TAX_RATE = 1.1

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 税込価格の表示
  def add_tax_price
    (self.price* TAX_RATE).floor
  end
  
  # user_idのお気に入りが存在するか
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
