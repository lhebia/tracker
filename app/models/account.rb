class Account < ApplicationRecord
  has_one :primary_user, primary_key: :primary_user_id, class_name: "User", dependent: :destroy
  has_many :users
end
