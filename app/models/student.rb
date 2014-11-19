class Student < ActiveRecord::Base
  include Userable

  belongs_to :section

  has_many :enrollments
  has_many :subjects, through: :enrollments

  delegate :name, :level, to: :section, prefix: true

end
