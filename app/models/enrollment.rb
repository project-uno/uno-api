class Enrollment < ActiveRecord::Base
  belongs_to :subject
  belongs_to :student

  validates_uniqueness_of :student_id, scope: :subject_id, message: "Student is already enrolled"

end
