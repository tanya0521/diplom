class CreateFinancings < ActiveRecord::Migration[5.0]
  def change
    create_table :financings do |t|
      t.text :name_financing, null: false
      t.integer:suum, null: false
      t.references :faculty, null: false, foreign_key: true
      t.references :scholarship_period, null: false, foreign_key: true
      t.references :type_scholarship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
