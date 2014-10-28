class Course::Work < ActiveRecord::Base

  belongs_to :course, class_name: 'Course'
  has_many :assigned_works, foreign_key: "course_work_id"

  after_create :assign_to_students


  private

  #should this be asynchronous?
  def assign_to_students
    course.enrolled_students.each do |student|
      assigned_works.create(student: student, status: 'incomplete')
    end
  end

end
