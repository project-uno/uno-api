class CreateCourseWorkCategories < ActiveRecord::Migration
  def change
    create_table :course_work_categories do |t|
      t.string :name
      t.decimal :weight

      t.integer :grading_system_id
      t.timestamps
    end
  end
end
