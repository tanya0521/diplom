class CreateFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :faculties do |t|
      t.text :namef, null: false
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
