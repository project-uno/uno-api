class Subject < ActiveRecord::Base

  validates :name, :description, presence: :true

  belongs_to :teacher
  has_many :enrollments
  has_many :enrolled_students, through: :enrollments, source: :student
  has_many :periods

  def enroll(student)
    enrollments.create(student:student)
  end

  def unenroll(student)
    enrollments.find_by_student_id(student.id).destroy if enrolled_students.include?(student)
  end
end
