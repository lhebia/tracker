class AddCoffeesToRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :coffees, :integer, default: 0
  end
end
