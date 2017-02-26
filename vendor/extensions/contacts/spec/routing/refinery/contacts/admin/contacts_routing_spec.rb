require "spec_helper"

describe "contacts admin routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to new" do
    expect( :get => "/refinery/contacts/new" ).to route_to(
      :controller => "refinery/contacts/admin/contacts",
      :action => "new",
      :locale => :en
    )

  end

  it "can route to create" do
    expect( :post => "/refinery/contacts" ).to be_routable
  end

  it "can route to show" do
    expect( :get => "/refinery/contacts/1" ).to route_to(
      :controller => "refinery/contacts/admin/contacts",
      :action => "show",
      :id => '1',
      :locale => :en
    )
  end

  it "can route to edit" do
    expect( :get => "/refinery/contacts/1/edit" ).to route_to(
      :controller => "refinery/contacts/admin/contacts",
      :action => "edit",
      :id => "1",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/refinery/contacts/1" ).not_to be_routable
  end

  it "does route to delete" do
    expect( :delete => "/refinery/contacts/1" ).to route_to(
      :controller => "refinery/contacts/admin/contacts",
      :action => "destroy",
      :id => '1',
      :locale => :en
    )
  end

end
