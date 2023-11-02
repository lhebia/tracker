class Bike < ApplicationRecord
  belongs_to :user

  has_many :rides
  
  validates :name, presence: true

  validates :year, format: { with: /\A(19|20)\d{2}\z/,
    message: 'Must be a valid year' }

  scope :ordered, -> { order(id: :desc) }

  scope :for_user, -> (user) { where(user_id: user.id) }

  # Could possiby use this once I set up a type of "feed"
  # The below three lines of code are equivalent to the last line
  # after_create_commit -> { broadcast_prepend_later_to "bikes" }
  # after_update_commit -> { broadcast_replace_later_to "bikes" }
  # after_destroy_commit -> { broadcast_remove_to "bikes" }
  # broadcasts_to ->(bike) { "bikes" }, inserts_by: :prepend
end
