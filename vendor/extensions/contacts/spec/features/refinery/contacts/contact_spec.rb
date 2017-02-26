# encoding: utf-8
require "spec_helper"

module Refinery
  module Contacts
    describe "contacts", type: :feature do

      before(:each) do
        Refinery::Contacts::Engine::load_seed
      end

      describe "Create contact" do

        before do
          visit refinery.new_contacts_contact_path
        end

        it "should create a new item" do
          fill_in "contact_name", :with => "Test"
          fill_in "contact_email", :with => "Test"
          fill_in "contact_message", :with => "Test"

          click_button ::I18n.t('.refinery.contacts.contacts.new.send')

          expect(page).to have_content("Thank You")
          expect(Refinery::Contacts::Contact.count).to eq(1)
        end
      end
    end
  end
end

