class CreateCourseAssignedWorks < ActiveRecord::Migration
  def change
    create_table :course_assigned_works do |t|

      t.integer :course_work_id
      t.integer :student_id
      t.timestamps
    end
  end
end
