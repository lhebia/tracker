class AddRideCountToBikes < ActiveRecord::Migration[7.1]
  def change
    add_column :bikes, :rides_count, :integer, default: 0, null: false
  end
end
