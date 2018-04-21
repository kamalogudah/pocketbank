class RemoveCategoryFromTransaction < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :category_id, :integer
  end
end
