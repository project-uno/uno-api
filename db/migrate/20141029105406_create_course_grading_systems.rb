class CreateCourseGradingSystems < ActiveRecord::Migration
  def change
    create_table :course_grading_systems do |t|

      t.integer :course_id
      t.timestamps
    end
  end
end
