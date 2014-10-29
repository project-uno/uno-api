class Course::AssignedWork < ActiveRecord::Base

  belongs_to :student
  belongs_to :course_work, class_name: 'Course::Work'
end
