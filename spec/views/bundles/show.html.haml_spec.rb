require 'spec_helper'

describe "bundles/show" do
  before(:each) do
    @bundle = assign(:bundle, stub_model(Bundle,
      :name => "Name",
      :type => "Type",
      :amount => "9.99",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(/9.99/)
    rendered.should match(/Category/)
  end
end
