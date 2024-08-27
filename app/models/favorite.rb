class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :item
  
  validates :user_id, uniqueness: {scope: :user_id}
end
