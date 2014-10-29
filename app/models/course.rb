class Course < ActiveRecord::Base
  validates :name, presence: :true

  belongs_to :teacher
  has_many :enrollments
  has_many :enrolled_students, through: :enrollments, source: :student
  has_many :works, class_name: 'Course::Work'
  has_one :grading_system

  def enroll(student)
    enrollments.create(course:self, student:student)
  end

  def unenroll(student)
    enrollments.find_by_student_id(student.id).destroy if enrolled_students.include?(student)
  end
end
