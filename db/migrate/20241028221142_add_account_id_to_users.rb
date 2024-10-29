class AddAccountIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :account_id, :bigint, null: false
  end
end