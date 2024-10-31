class Vendor < ApplicationRecord
  belongs_to :account

  validates_presence_of :name

  # TODO: Make this take the account object, not ID
  scope :for_account, -> (account_id) { where(account_id: account_id) }
end
