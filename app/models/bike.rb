class Bike < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # The below three lines of code are equivalent to the last line
  # after_create_commit -> { broadcast_prepend_later_to "bikes" }
  # after_update_commit -> { broadcast_replace_later_to "bikes" }
  # after_destroy_commit -> { broadcast_remove_to "bikes" }
  broadcasts_to ->(bike) { "bikes" }, inserts_by: :prepend
end
