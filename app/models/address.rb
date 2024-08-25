class Address < ApplicationRecord

  belongs_to :user
  # 郵便番号の正規表現
  POST_CODE = /\A\d{3}[-]\d{4}\z/

  validates :post_code, presence: true, format: { with: POST_CODE }
  validates :address, presence: true
  validates :name, presence: true
end
