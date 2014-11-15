require 'rails_helper'

RSpec.describe API::V1::SubjectsController, :type => :controller do

  let(:subject) { create(:subject) }

  describe "GET #show" do

    context "when resource exists" do
      before do
        get :show, { id: "#{subject.id}"}
      end

      it "returns the subject" do
        expect(response).to have_http_status 200
      end

    end

    context "when resource does not exist" do
      before do
        get :show, { id: "42" }
      end

      it "returns not found error" do
        expect(response).to have_http_status 404
      end

      it "contains error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end
  end

  describe "POST #create" do

    before do
      post :create, subject_params
    end

    context "when fields are valid" do
      let(:subject_params) do
        {subject:{ name: 'Fil03', description: 'Noli Me Tangere'}}
      end

      it "returns created status" do
        expect(response).to have_http_status 201        
      end

      it "returns the newly created subject" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("subject")
      end

    end

    context "when some field is invalid" do
      let(:subject_params) do
        {subject:{ name: '', description: 'Noli Me Tangere'}}
      end

      it "returns unprocessable_entity status" do
        expect(response).to have_http_status 422
      end

      it "returns an error message" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("error")
      end

    end

  end

  describe "PUT #update" do

  end

  describe "DELETE #delete" do

  end

end
