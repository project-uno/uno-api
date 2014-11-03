class Section < ActiveRecord::Base

  has_many :students
  has_many :periods
  has_many :subjects, through: :periods
end
