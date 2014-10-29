class Course::GradingSystem < ActiveRecord::Base

  has_many :work_category
end
