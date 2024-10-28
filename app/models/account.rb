class Account < ApplicationRecord
  has_one :primary_user, dependent: :destroy
  has_many :users
end
