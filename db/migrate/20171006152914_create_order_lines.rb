class CreateOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lines do |t|
      t.date :begin_date, null: false
      t.date :end_date, null: false
      t.integer :scholarship, null: false
      t.references :student, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :scholarship_period, null: false, foreign_key: true
      t.references :type_scholarship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
