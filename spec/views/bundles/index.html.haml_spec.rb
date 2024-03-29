require 'spec_helper'

describe "bundles/index" do
  before(:each) do
    assign(:bundles, [
      stub_model(Bundle,
        :name => "Name",
        :type => "Type",
        :amount => "9.99",
        :category => "Category"
      ),
      stub_model(Bundle,
        :name => "Name",
        :type => "Type",
        :amount => "9.99",
        :category => "Category"
      )
    ])
  end

  it "renders a list of bundles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
