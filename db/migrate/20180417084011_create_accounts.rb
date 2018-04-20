class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :number
      t.decimal :balance
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
