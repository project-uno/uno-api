require 'rails_helper'

RSpec.describe Course::Work, :type => :model do
  
  let(:course_work) { Course::Work.new }

  it { expect(course_work).to belong_to(:course) }
  it { expect(course_work).to have_many(:assigned_works)}

  it "should assign the work to students after create" do
    expect(course_work).to receive(:assign_to_students)
    course_work.save
  end

end
