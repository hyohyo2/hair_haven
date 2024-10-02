class NoticeGenre < ApplicationRecord

  has_many :notices, dependent: :destroy

  validates :name, presence: true

end
