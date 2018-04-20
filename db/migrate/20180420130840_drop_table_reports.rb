class DropTableReports < ActiveRecord::Migration[5.1]
  def up
    drop_table :reports
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
