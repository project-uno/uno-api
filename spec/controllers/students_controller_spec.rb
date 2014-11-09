require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do

  describe 'POST /students/register' do
    let(:student_params) do
      {
        first_name: 'Jose',
        last_name: 'Rizal',
        email: 'jose.rizal@ph.com'
      }
    end

    context 'when all fields are valid' do
      before do
        post 'register', student_params
      end

      it 'returns status 200' do
        expect(response.status).to eq 200
      end

      it 'returns the newly created student' do
        body = JSON.parse(response.body)
        expect(body.keys).to include("student")
      end
    end

    context 'when there are invalid fields' do
      before do
        2.times { post 'register', student_params }
      end

      it 'returns status 400' do
        expect(response.status).to eq 400
      end

      it 'returns an error message' do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end
    end
  end

end
