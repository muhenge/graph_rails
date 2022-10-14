class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :debit
      t.integer :credit
      t.integer :amount
      t.time :date

      t.timestamps
    end
  end
end
