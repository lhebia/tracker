class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :name, null:false
      t.string :make
      t.string :model
      t.text :description
      t.string :serial_number
      t.integer :user_id
      t.integer :year

      t.timestamps
    end
  end
end
