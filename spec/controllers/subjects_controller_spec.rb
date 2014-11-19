require 'rails_helper'

RSpec.describe API::V1::SubjectsController, :type => :controller do

  let(:subject) { create(:subject) }

  describe 'GET #index' do

    context "when getting all subjects"

    context "when filtered by teacher" do
      let(:teacher) { create(:teacher) }

      it "returns the subjects for the given teacher" do
        subject.update_attribute(:teacher,teacher)
        get :index, teacher_id: "#{teacher.id}"

        body = JSON.parse(response.body)
        expect(body["subjects"]).not_to be_empty
      end

      it "returns an empty array" do
        get :index, teacher_id: "#{teacher.id}"

        body = JSON.parse(response.body)
        expect(body["subjects"]).to be_empty
      end

    end
  end


  describe "GET #show" do

    context "when resource exists" do
      before do
        get :show, { id: "#{subject.id}"}
      end

      it { expect(response).to have_http_status 200 }

      it "returns the subject" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("subject")
      end

    end

    context "when resource does not exist" do
      before do
        get :show, { id: "42" }
      end

      it { expect(response).to have_http_status 404 }

      it "contains error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end
  end

  describe "POST #create" do

    before { post :create, subject_params }

    context "when fields are valid" do
      let(:subject_params) do
        {subject:{ name: 'Fil03', description: 'Noli Me Tangere'}}
      end

      it { expect(response).to have_http_status 201 }

      it "returns the newly created subject" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("subject")
      end

    end

    context "when some field is invalid" do
      let(:subject_params) do
        {subject:{ name: '', description: 'Noli Me Tangere'}}
      end

      it { expect(response).to have_http_status 422 }

      it "returns an error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end

  end

  describe "PATCH #update" do

    before do
      patch :update, id: subject.id, subject: subject_params
    end

    context "when fields are valid" do
      let(:subject_params) do
        { name: 'FIL03', description: 'Noli Me Tangere by Jose Rizal'}
      end

      it { expect(response).to have_http_status 200 }

      it "updates the record" do
        subject.reload
        expect(subject.name).to eq "FIL03"
        expect(subject.description).to eq 'Noli Me Tangere by Jose Rizal'
      end
    end

    context "when a field is invalid" do
      let(:subject_params) { { name: '', description: 'El Fili'} }
      it { expect(response).to have_http_status 422 }

      it "returns an error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end

  end

  describe "DELETE #delete" do
    context "when subject exists" do
      before { delete :destroy, id: subject.id }
      it {expect(response).to have_http_status 204 }
    end

    context "when subject is non-existent" do
      before { delete :destroy, id: "22323" }
      it { expect(response).to have_http_status 404 }
    end
  end

end
