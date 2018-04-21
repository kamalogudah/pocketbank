class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.decimal :amount
      t.string :from
      t.string :to
      t.belongs_to :user, foreign_key: true
      t.belongs_to :account, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.timestamps
    end
  end
end
