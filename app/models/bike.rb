class Bike < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  scope :for_user, -> (user) { where(user_id: user.id) }

  # Could possiby use this once I set up a type of "feed"
  # The below three lines of code are equivalent to the last line
  # after_create_commit -> { broadcast_prepend_later_to "bikes" }
  # after_update_commit -> { broadcast_replace_later_to "bikes" }
  # after_destroy_commit -> { broadcast_remove_to "bikes" }
  # broadcasts_to ->(bike) { "bikes" }, inserts_by: :prepend
end
