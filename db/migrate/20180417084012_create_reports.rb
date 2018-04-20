class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.datetime :date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
