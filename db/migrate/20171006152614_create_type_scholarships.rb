class CreateTypeScholarships < ActiveRecord::Migration[5.0]
  def change
    create_table :type_scholarships do |t|
      t.text :name_financing, null: false
      t.text :typescholarship, null: false

      t.timestamps
    end
  end
end
