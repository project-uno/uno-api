require 'rails_helper'

RSpec.describe Course, type: :model do

  let(:course) { Course.new(name: "CS101") }

  it { expect(course).to validate_presence_of :name } 
  it { expect(course).to belong_to(:teacher) }
  it { expect(course).to have_many(:enrolled_students).through(:enrollments)}
  it { expect(course).to have_many(:works)}
  it { expect(course).to have_one(:grading_system)}
  
  context "enrollment" do
    let(:student) { create(:student) }

    before do
      course.save
    end 
    
    it "enrolls the student" do
      course.enroll(student)
      expect(course.enrollments.count).to eq 1
      expect(course.enrolled_students.include?(student)).to be_truthy
    end

    it "won't double enroll the student if already enrolled" do
      course.enroll(student)
      course.enroll(student)
      expect(course.enrollments.count).to eq 1
      expect(course.enrolled_students.include?(student)).to be_truthy
    end

    it "unenrolls the student" do
      course.enroll(student)
      course.unenroll(student)
      expect(course.enrollments.count).to eq 0
      expect(course.enrolled_students.include?(student)).to be_falsy
    end
  end

end
