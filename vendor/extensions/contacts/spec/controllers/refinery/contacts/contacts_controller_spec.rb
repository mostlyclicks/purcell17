require "spec_helper"

module Refinery
  module Contacts
    describe ContactsController, type: :controller do

      before do
        @route = Refinery::Contacts::Engine.routes
        Refinery::Contacts::Engine::load_seed

        @new_page = Refinery::Page.new
        allow(Refinery::Page).to receive_messages(:where => [ @new_page ])
      end

      describe "GET new" do
        it "before_filter assigns a new contact" do
          get :new
          expect(assigns(:contact)).to be_a_new(Contact)
        end
        it "before_filter assigns page to contacts/new" do
          get :new
          expect(assigns(:page)).to eq @new_page
        end
      end

      describe "POST create" do

        before{
          allow_any_instance_of(Contact).to receive(:save).and_return( true )
        }


        it "before_filter assigns page to contacts/new" do
          post :create, contact: {name: "foo", email: "foo", }
          expect(assigns(:page)).to eq @new_page
        end

        it "before_filter assigns a new contact" do
          post :create, contact: {name: "foo", email: "foo", }
          expect(assigns(:contact)).to be_a_new(Contact)
        end

        it "redirects to thank_you" do
          post :create, contact: {name: "foo", email: "foo", }
          expect(response).to redirect_to "/contacts/thank_you"
        end

        describe "when it can't save the contact" do

          before {
          allow_any_instance_of(Contact).to receive(:save).and_return( false )
          }

          it "redirects to new if it can't save" do
            post :create, contact: {name: "foo", email: "foo", }

            expect(response).to render_template(:new)
          end
        end

      end
    end
  end
end
