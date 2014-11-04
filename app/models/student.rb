class Student < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user

  belongs_to :section 

  has_many :enrollments
  has_many :subjects, through: :enrollments

  delegate :first_name, :last_name, :full_name, :email, to: :user

end
