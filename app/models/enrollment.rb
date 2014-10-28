class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates_uniqueness_of :student_id, scope: :course_id, message: "Student is already enrolled"

end
