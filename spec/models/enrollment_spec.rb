require 'rails_helper'

RSpec.describe Enrollment, :type => :model do
  let(:enrollment) { Enrollment.new }

  it { expect(enrollment).to belong_to(:subject)  }
  it { expect(enrollment).to belong_to(:student) }
  it { expect(enrollment).to validate_uniqueness_of(:student_id).with_message("Student is already enrolled") }

end
