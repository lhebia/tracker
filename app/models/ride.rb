class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  
  validates :name, presence: true

  scope :for_user, -> (user) { where(user_id: user.id) }
end