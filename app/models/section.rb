class Section < ActiveRecord::Base

  validates :name, :level, presence: true

  has_many :students
  has_many :periods
  has_many :subjects, through: :periods
end
