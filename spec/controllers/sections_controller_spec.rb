require 'rails_helper'

RSpec.describe API::V1::SectionsController, type: :controller do

  let(:section) { create(:section)}

  describe "GET #index"

  describe "GET #show" do
    context "when section exists" do
      before do
        get :show, { id: "#{section.id}"}
      end

      it "returns ok status" do
        expect(response).to have_http_status 200
      end

      it "returns the section" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("section")
      end
    end

    context "when section does not exists" do
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
      post :create, section_params
    end

    context "when fields are valid" do
      let(:section_params) do
        {section:{ name: 'Section1A', level: '4'}}
      end

      it "returns created status" do
        expect(response).to have_http_status 201        
      end

      it "returns the newly created section" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("section")
      end

    end

    context "when a field is invalid" do
      let(:section_params) do
        {section:{ level: '4'}}
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

  describe "PATCH #update" do

    context "when section exists" do

      before do
        patch :update, id: section.id, section: section_params
      end

      context "when fields are valid" do
        let(:section_params) do
          { name: 'Section 4A'}
        end

        it "returns ok status" do
          expect(response).to have_http_status 200
        end

        it "updates the record" do
          section.reload
          expect(section.name).to eq "Section 4A"
          expect(section.level).to eq '4'
        end
      end

      context "when a field is invalid" do
        let(:section_params)  {{ name: ''}}

        it "returns unprocessable_entity status" do
          expect(response).to have_http_status 422
        end

        it "returns an error message" do
          body = JSON.parse(response.body)
          expect(body.keys).to include("error")
        end

      end
    end

    context "when section does not exists" do
      let(:section_params)  { Hash.new(name: "Ghost Section", level: "42") }
      it "returns not found error" do
        patch :update, id: 42, section: section_params
        expect(response).to have_http_status 404
      end
    end
  end

  describe "DELETE #destroy" do
    context "when section exists" do
      before do
        delete :destroy, id: section.id
      end

      it "returns no content" do
        expect(response).to have_http_status 204
      end
    end

    context "when section is non-existent" do
      before do
        delete :destroy, id: "22323"
      end

      it "returns resource not found" do
        expect(response).to have_http_status 404
      end
    end
  end 
  
end
