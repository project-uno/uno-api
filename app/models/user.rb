class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  belongs_to :meta, polymorphic: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
