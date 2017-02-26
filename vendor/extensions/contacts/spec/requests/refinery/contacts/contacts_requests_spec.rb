require "spec_helper"

module Refinery
  module Contacts

    describe "Contacts request specs", type: :request do

      before(:each) do
        Refinery::Contacts::Engine.load_seed
      end

      it "successfully gets the index path as redirection" do
        get("/contacts")
        expect(response).to be_redirect
        expect(response).to redirect_to("/contacts/new")
      end

      it "successfully gets the new path" do
        get("/contacts/new")
        expect(response).to be_success
        expect(response).to render_template(:new)
      end

      it "successfully gets the thank_you path" do
        get("/contacts/thank_you")
        expect(response).to be_success
        expect(response).to render_template(:thank_you)
      end

    end
  end
end
