# encoding: utf-8
require "spec_helper"

module Refinery
  module Contacts
    module Admin
      describe Contact, type: :feature do
        refinery_login_with :refinery_user

       describe "contacts list" do
          before do
            FactoryGirl.create(:contact, :name => "UniqueTitleOne")
            FactoryGirl.create(:contact, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.contacts_admin_contacts_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

       describe "show" do
         let!(:contact) do
            FactoryGirl.create(:contact, :name => "UniqueTitleOne")
          end

         it "has expected text and menu" do
           visit refinery.contacts_admin_contacts_path

           click_link "Read the contact"

           expect(page).to have_content("UniqueTitleOne")
           expect(page).not_to have_content("UniqueTitleTwo")

           within "#actions" do
             expect(page).to have_content("Age")
             expect(page).to have_content("Back to all contacts")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/contacts']")
             expect(page).to have_content("Remove this contact forever")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/contacts/#{contact.id}']")
           end
         end
       end

       describe "when no " do
         before { Refinery::Contacts::Contact.destroy_all }

         context "contacts" do
           it "shows expected message" do
            visit refinery.contacts_admin_contacts_path

            expect(page).to have_content("You have not received any contacts yet.")

            end
           end

     end

      describe "action links" do
        before { visit refinery.contacts_admin_contacts_path }

        specify "in the side pane" do
          within "#actions" do
            expect(page).to have_content("Inbox")
            expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/contacts']")

            expect(page).to have_content("Update who gets notified")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/contacts/settings/contact_notification_recipients/edit']")
            expect(page).to have_content("Edit confirmation email")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/contacts/settings/contact_confirmation_message/edit']")
          end
        end
      end



        describe "destroy" do
          before { FactoryGirl.create(:contact, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contacts_admin_contacts_path

            click_link "Remove this contact forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Contacts::Contact.count).to eq 0
          end
        end

          describe "destroy from contact show page" do
          before { FactoryGirl.create(:contact, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contacts_admin_contact_path( :id => '1')

            click_link "Remove this contact forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Contacts::Contact.count).to eq 0
          end
          end

      end
    end
  end
end
