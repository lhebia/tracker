class RemoveBikeidFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :bike_id
  end
end
