require 'rails_helper'

RSpec.describe API::V1::StudentsController, :type => :controller do

  let(:student) { create(:student) }

  describe 'GET #index' do

    context "when getting all students"

    context "when filtered by section" do
      let(:section) { create(:section) }

      it "returns the students for the given section" do
        student.update_attribute(:section,section)
        get :index, section_id: "#{section.id}"

        body = JSON.parse(response.body)
        expect(body["students"]).not_to be_empty
      end

      it "returns an empty array" do
        get :index, section_id: "#{section.id}"

        body = JSON.parse(response.body)
        expect(body["students"]).to be_empty
      end

    end

  end

  describe 'GET #show' do

    context 'student exists' do

      before { get :show, id: "#{student.id}" }
    
      it { expect(response).to have_http_status 200 }

      it "returns the student resource" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("student")
      end
    end

    context 'student does not exists' do
      before { get :show, id: "2323" }
      it { expect(response).to have_http_status(404) }

      it "returns an error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end
    end

  end

  describe 'POST api/v1/students' do
    let(:student_params) do
      {student:    
        { first_name: 'Jose',
          last_name: 'Rizal',
          email: 'jose.rizal@ph.com',
          school_id: 'ABC001'
        }
      }
    end

    context 'when all fields are valid' do

      before { post 'create', student_params }

      it { expect(response.status).to eq 201 }

      it 'returns the newly created student' do
        body = JSON.parse(response.body)
        expect(body.keys).to include("student")
      end
    end

    context 'when there are invalid fields' do
      before {2.times { post 'create', student_params }}

      it { expect(response.status).to eq 422 }

      it 'returns an error message' do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end
    end
  end

  describe 'PATCH #update' do

    before do
      patch :update, id: "#{student.id}" , student: student_params
    end 

    context 'when fields are valid' do

      let(:student_params) { {school_id: 'XYZ002'} }

      it { expect(response).to have_http_status 200 }

      it "updates the resource" do
        student.reload
        expect(student.school_id).to eq "XYZ002"
      end
    end

    context 'when a field is invalid' do

      let(:student_params) { { email: '' } }

      it { expect(response).to have_http_status 422 }

      it "returns an error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end

  end

  describe "DELETE #delete" do
    context "when student exists" do
      before { delete :destroy, id: student.id }
      it { expect(response).to have_http_status 204 }
    end

    context "when student is non-existent" do
      before { delete :destroy, id: "22323" }
      it { expect(response).to have_http_status 404 }
    end
  end

end
