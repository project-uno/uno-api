require 'rails_helper'

RSpec.describe API::V1::SubjectsController, :type => :controller do

  let(:subject) { create(:subject) }

  describe "GET api/v1/subjects" do

    context "when resource exists" do
      it "returns the subject" do
        get :show, "#{subject.id}"
        expect(response.status).to eq 200
      end

    end

    context "when resource does not exist" do
      it "returns 404"
    end
  end

  describe "POST #create" do

  end

  describe "PUT #update" do

  end

  describe "DELETE #delete" do

  end

end
