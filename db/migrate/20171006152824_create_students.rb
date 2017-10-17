class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.text :fn, null: false
      t.text :sn, null: false
      t.text :ln, null: false
      t.string :birthday, null: false
      t.integer :course, null: false
      t.references :faculty, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
