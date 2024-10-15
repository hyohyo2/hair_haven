class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { genderless: 0, female: 1, male: 2 }

  has_many :addresses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order, dependent: :destroy

  # 郵便番号の正規表現
  POST_CODE = /\A\d{3}[-]\d{4}\z/

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :gender, presence: true
  validates :post_code, presence: true, format: { with: POST_CODE }
  validates :address, presence: true
  validates :telephone_number, presence: true, length: { in: 10..11 }
  validates :is_active, inclusion: { in: [true,false] }

  def full_name
    last_name + " " + first_name
  end

  def self.admin_search_for(content)
    User.where("last_name LIKE ? OR first_name LIKE ?", "%" + content + "%", "%" + content + "%")
  end


end
