class CreateCourseWorks < ActiveRecord::Migration
  def change
    create_table :course_works do |t|

      t.integer :course_id
      t.timestamps
    end
  end
end
