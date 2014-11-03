require 'rails_helper'

RSpec.describe Teacher, :type => :model do
  let(:teacher) { Teacher.new }

  it{ expect(teacher).to have_one(:user) }
  it{ expect(teacher).to have_many(:subjects) }
  it{ expect(teacher).to have_many(:periods).through(:subjects) }
end
