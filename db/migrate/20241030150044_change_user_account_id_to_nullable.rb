class ChangeUserAccountIdToNullable < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :account_id, :bigint, null: true
  end
end
