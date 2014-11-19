require 'rails_helper'

RSpec.describe API::V1::SectionsController, type: :controller do

  let(:section) { create(:section)}

  describe "GET #index" do

    it "returns all sections" do
      get :index
      expect(response).to have_http_status 200
      body = JSON.parse(response.body)
      expect(body.keys).to include("sections")
    end

  end

  describe "GET #show" do
    context "when section exists" do
      before do
        get :show, { id: "#{section.id}"}
      end

      it { expect(response).to have_http_status 200 }

      it "returns the section" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("section")
      end
    end

    context "when section does not exists" do
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
    before { post :create, section_params }

    context "when fields are valid" do
      let(:section_params) do
        {section:{ name: 'Section1A', level: '4'}}
      end

      it { expect(response).to have_http_status 201 }

      it "returns the newly created section" do
        body = JSON.parse(response.body)
        expect(body.keys).to include("section")
      end

    end

    context "when a field is invalid" do
      let(:section_params) do
        {section:{ level: '4'}}
      end

      it { expect(response).to have_http_status 422 }

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

        it { expect(response).to have_http_status 200 }

        it "updates the record" do
          section.reload
          expect(section.name).to eq "Section 4A"
          expect(section.level).to eq '4'
        end
      end

      context "when a field is invalid" do
        let(:section_params)  {{ name: ''}}

        it { expect(response).to have_http_status 422 }

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
      before { delete :destroy, id: section.id }
      it { expect(response).to have_http_status 204 }
    end

    context "when section is non-existent" do
      before { delete :destroy, id: "22323" }
      it { expect(response).to have_http_status 404 }
    end
  end 
  
end
