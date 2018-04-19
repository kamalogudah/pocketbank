class RemoveColumnFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :transaction_id, :integer
  end
end
