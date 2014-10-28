class Course < ActiveRecord::Base
  validates :name, presence: :true

  belongs_to :teacher
  has_many :enrollments
  has_many :students , through: :enrollments

  def enroll(student)
    enrollments.create(course:self, student:student)
  end

  def unenroll(student)
    enrollments.find_by_student_id(student.id).destroy if students.include?(student)
  end
end
