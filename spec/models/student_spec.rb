require 'rails_helper'

RSpec.describe Student, :type => :model do
  let(:student) { Student.new }

  it{ expect(student).to have_one(:user) }
  it{ expect(student).to belong_to(:section) }

  it{ expect(student).to have_many(:enrollments) }
  it{ expect(student).to have_many(:subjects).through(:enrollments) }
end
