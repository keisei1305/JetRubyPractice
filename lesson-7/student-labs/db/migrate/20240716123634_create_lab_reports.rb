class CreateLabReports < ActiveRecord::Migration[7.1]
  def change
    create_table :lab_reports do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :grade

      t.timestamps
    end
  end
end
