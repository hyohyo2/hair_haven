class Tag < ApplicationRecord

  # 中間テーブルitem_tagsへの関連付け
  has_many :item_tags, dependent: :destroy
  # 中間テーブルitem_tagを介してitemへの関連付け
  has_many :items, through: :item_tags, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 20 }

end
