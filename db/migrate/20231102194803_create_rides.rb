class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides, id: :bigint, unsigned: true do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.bigint :distance
      t.integer :elevation
      t.text :description
      t.belongs_to :user, index: true
      t.belongs_to :bike, index: true

      t.timestamps
    end
  end
end
