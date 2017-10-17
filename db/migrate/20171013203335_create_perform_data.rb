class CreatePerformData < ActiveRecord::Migration[5.0]
  def change
    create_table :perform_data do |t|
      t.integer :quantity5, null: false
      t.integer :quantity4, null: false
      t.integer :quantity3, null: false
      t.integer :quantity2, null: false
      t.references :student, null: false, foreign_key: true
      t.references :scholarship_period, null: false, foreign_key: true

      t.timestamps
    end
  end
end
