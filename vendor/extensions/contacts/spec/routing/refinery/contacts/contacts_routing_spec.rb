require "spec_helper"

describe "Contacts front-end routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to index" do
    expect( :get => "/contacts" ).to route_to(
      :controller => "refinery/contacts/contacts",
      :action => "index",
      :locale => :en
    )
  end

  it "can route to new" do
    expect( :get => "/contacts/new" ).to route_to(
      :controller => "refinery/contacts/contacts",
      :action => "new",
      :locale => :en
    )
  end

  it "can route to create" do
    expect( :post => "/contacts" ).to route_to(
      :controller => "refinery/contacts/contacts",
      :action => "create",
      :locale => :en
    )
  end

  it "routes to thank_you" do
    expect( :get => "/contacts/thank_you" ).to route_to(
      :controller => "refinery/contacts/contacts",
      :action => "thank_you",
      :locale => :en
    )
  end

  it "does not route to show" do
    expect( :get => "/contacts/1" ).not_to route_to(
      :controller => "refinery/contacts/contacts",
      :action => "show",
      :locale => :en
    )
  end

  it "does not route to edit" do
    expect( :get => "/contacts/1/edit" ).not_to route_to(
      :controller => "refinery/contacts/contacts",
      :action => "edit",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/contacts/1" ).not_to be_routable
  end

  it "does not route to delete" do
    expect( :delete => "/contacts/1" ).not_to be_routable
  end

end
