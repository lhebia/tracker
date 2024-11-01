class PurchaseTransaction < ApplicationRecord
  belongs_to :account

  belongs_to :vendor

  # TODO: Make this take the account object, not ID
  scope :for_account, -> (account_id) { where(account_id: account_id) }

  monetize :amount_cents, allow_nil: true, numericality: {greater_than: 0}
end
