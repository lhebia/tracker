class AddBikeReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :bike, null: false, foreign_key: true
  end
end
