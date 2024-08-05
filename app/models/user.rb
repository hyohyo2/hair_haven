class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { genderless: 0, female: 1, male: 2 }

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




end
