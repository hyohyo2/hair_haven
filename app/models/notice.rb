class Notice < ApplicationRecord

  belongs_to :notice_genre

  validates :title, presence: true
  validates :detail, presence: true
  validates :notice_genre_id, presence: true

  def self.search_for(content)
    Notice.where("title LIKE ?", "%" + content + "%" )
  end
  
end
