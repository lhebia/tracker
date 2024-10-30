class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  
  validates :name, presence: true

  scope :ordered, -> { order(date: :desc) }

  scope :for_user, -> (user) { where(user_id: user.id) }

  def duration_in_mins
    return 0 if end_time.nil? || stat_time.nil?
    ((end_time - start_time) / 60).to_i
  end
end