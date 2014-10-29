class Course::Work < ActiveRecord::Base

  belongs_to :course, class_name: 'Course'
  belongs_to :category, class_name: 'Course::WorkCategory', foreign_key: "work_category_id"
  has_many :assigned_works, foreign_key: "course_work_id"

  after_create :assign_to_students


  private

  #this should be asynchronous
  def assign_to_students
    course.enrolled_students.each do |student|
      assigned_works.create(student: student, status: 'incomplete')
    end
  end

end
