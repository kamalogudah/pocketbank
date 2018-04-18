class RemoveColumnFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :report_id, :integer
  end
end
