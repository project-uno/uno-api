class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :schedule
      t.integer :teacher_id

      t.timestamps
    end
  end
end
