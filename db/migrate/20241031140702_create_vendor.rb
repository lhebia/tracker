class CreateVendor < ActiveRecord::Migration[7.1]
  def change
    create_table :vendors do |t|
      t.string :name, null: false
      t.bigint :account_id, null: false 
      t.string :description
      t.string :postal_code

      t.timestamps
    end
  end
end
