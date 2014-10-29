require 'rails_helper'

RSpec.describe Course::AssignedWork, type: :model do
  
  let(:assigned_work) { Course::AssignedWork.new }

  it { expect(assigned_work).to belong_to(:student)}
  it { expect(assigned_work).to belong_to(:course_work)}
end
