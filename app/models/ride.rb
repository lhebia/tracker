class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  
  validates :name, presence: true

  scope :ordered, -> { order(date: :desc) }

  scope :for_user, -> (user) { where(user_id: user.id) }

  def duration_in_mins
    ((end_time - start_time) / 60).to_i
  end
end