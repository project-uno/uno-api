class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :location
      t.string :schedule

      t.integer :subject_id
      t.integer :section_id
      t.timestamps
    end
  end
end
