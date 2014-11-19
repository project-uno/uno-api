require 'rails_helper'

RSpec.describe API::V1::TeachersController, :type => :controller do

  let(:teacher) { create(:teacher)}

  describe "GET #index" do
    it "returns all teachers" do
      teacher
      get :index
      expect(response).to have_http_status 200
      body = JSON.parse(response.body)
      expect(body["teachers"]).not_to be_empty
    end
  end

  describe "GET #show" do
    context "when teacher exists" do
      before { get :show, id: "#{teacher.id}" }

      it { expect(response).to have_http_status 200 }

      it "returns the teacher" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("teacher")
      end
    end

    context "when teacher does not exists" do
      before { get :show, id: "42" }

      it { expect(response).to have_http_status 404 }

      it "contains error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end
    end

  end

  describe 'POST /api/v1/teachers' do
    let(:teacher_params) do
      {teacher:
        {
          first_name: 'Jose',
          last_name: 'Rizal',
          email: 'jose.rizal@ph.com',
          school_id: "T0001"
        }
      }
    end

    context 'when all fields are valid' do
      before { post 'create', teacher_params }

      it { expect(response.status).to eq 201 }

      it 'returns the newly created teacher' do
        body = JSON.parse(response.body)
        expect(body.keys).to include("teacher")
      end
    end

    context 'when there are invalid fields' do
      before do
        2.times { post 'create', teacher_params }
      end

      it { expect(response.status).to eq 422 }

      it 'returns an error message' do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end
    end
  end

  describe 'PATCH #update' do

    before do
      patch :update, id: "#{teacher.id}" , teacher: teacher_params
    end 

    context 'when fields are valid' do

      let(:teacher_params) { {school_id: 'XYZ043'} }

      it { expect(response).to have_http_status 200 }

      it "updates the resource" do
        teacher.reload
        expect(teacher.school_id).to eq "XYZ043"
      end
    end

    context 'when a field is invalid' do

      let(:teacher_params) { { email: '' } }

      it { expect(response).to have_http_status 422 }

      it "returns an error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end
  end

  describe "DELETE #destroy" do
    context "when teacher exists" do
      before { delete :destroy, id: teacher.id }
      it { expect(response).to have_http_status 204 }
    end

    context "when teacher is non-existent" do
      before { delete :destroy, id: "22323" }
      it { expect(response).to have_http_status 404 }
    end
  end

end
