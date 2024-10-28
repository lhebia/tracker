class CreateAccount < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, default: "", null: true
      t.bigint :primary_user_id, null: false

      t.timestamps
    end
  end
end
