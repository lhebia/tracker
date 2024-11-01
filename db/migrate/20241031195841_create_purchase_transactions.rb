class CreatePurchaseTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_transactions do |t|
      t.monetize :amount, null: false
      t.bigint :account_id, null: false
      t.bigint :vendor_id
      t.date :date
      t.string :description
      t.string :source_id

      t.timestamps
    end

    add_index :purchase_transactions, [:source_id], unique: true
    add_index :purchase_transactions, [:account_id]
  end
end
