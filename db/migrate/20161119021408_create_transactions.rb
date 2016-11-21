class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_no
      t.integer :transaction_type
      t.decimal :amount
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
