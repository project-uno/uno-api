require 'rails_helper'

RSpec.describe Student, :type => :model do

  let(:student) { Student.new }
  it { expect(student).to have_many(:courses).through(:enrollments)}
end
