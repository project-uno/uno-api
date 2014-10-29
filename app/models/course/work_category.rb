class Course::WorkCategory < ActiveRecord::Base

  validates :name, :weight, presence: true
  

end
