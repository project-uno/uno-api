class Teacher < ActiveRecord::Base
  include Userable

  has_many :subjects
  has_many :periods, through: :subjects
end
