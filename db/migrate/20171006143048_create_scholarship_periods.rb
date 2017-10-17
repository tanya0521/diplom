class CreateScholarshipPeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :scholarship_periods do |t|
      t.date :begin, null: false
      t.date :end, null: false

      t.timestamps
    end
  end
end
