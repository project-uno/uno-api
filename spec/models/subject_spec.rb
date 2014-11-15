require 'rails_helper'

RSpec.describe Subject, :type => :model do

  let(:subject) { Subject.new(name: "CS101", description: "Intro to Programming") }

  it { expect(subject).to validate_presence_of :name } 
  it { expect(subject).to validate_presence_of :description }
  it { expect(subject).to belong_to(:teacher) }
  it { expect(subject).to have_many(:enrolled_students).through(:enrollments)}
  it { expect(subject).to have_many(:periods)}
  
  context "enrollment" do
    let(:student) { create(:student) }

    before do
      subject.save
    end 
    
    it "enrolls the student" do
      subject.enroll(student)
      expect(subject.enrollments.count).to eq 1
      expect(subject.enrolled_students.include?(student)).to be_truthy
    end

    it "won't double enroll the student if already enrolled" do
      subject.enroll(student)
      subject.enroll(student)
      expect(subject.enrollments.count).to eq 1
      expect(subject.enrolled_students.include?(student)).to be_truthy
    end

    it "unenrolls the student" do
      subject.enroll(student)
      subject.unenroll(student)
      expect(subject.enrollments.count).to eq 0
      expect(subject.enrolled_students.include?(student)).to be_falsy
    end
  end
end
