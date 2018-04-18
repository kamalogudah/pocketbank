class RemoveColumnsFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :from, :string
    remove_column :transactions, :to, :string
    remove_column :transactions, :report, :belongs_to
  end
end
