require 'rails_helper'

RSpec.describe Registration do

  let(:user_params) do
    {
      first_name: 'Jose',
      last_name:  'Rizal',
      email:      'jose.rizal@ph.com'
    }
  end

  describe '.create_teacher!' do
    it 'creates a new teacher' do
      registration = Registration.new(user_params)
      teacher = registration.create_teacher!
      expect(teacher.persisted?).to be_truthy
    end
  end

  describe '.create_student!' do
    it 'creates a new student' do
      registration = Registration.new(user_params)
      student = registration.create_student!
      expect(student.persisted?).to be_truthy
    end
  end

end
