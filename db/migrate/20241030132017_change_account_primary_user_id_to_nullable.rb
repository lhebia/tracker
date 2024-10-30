class ChangeAccountPrimaryUserIdToNullable < ActiveRecord::Migration[7.1]
  def change
    change_column :accounts, :primary_user_id, :bigint, null: true
  end
end
