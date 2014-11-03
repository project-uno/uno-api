class Teacher < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user
  
  has_many :subjects
  has_many :periods, through: :subjects

  delegate :first_name, :last_name, :full_name, :email, to: :user
end
