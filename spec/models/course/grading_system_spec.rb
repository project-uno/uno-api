require 'rails_helper'

RSpec.describe Course::GradingSystem, type: :model do
  
  let(:grading_system) { Course::GradingSystem.new }

  it{ expect(grading_system).to have_many(:work_category)}

end
