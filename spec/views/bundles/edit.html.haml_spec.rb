require 'spec_helper'

describe "bundles/edit" do
  before(:each) do
    @bundle = assign(:bundle, stub_model(Bundle,
      :name => "MyString",
      :type => "",
      :amount => "9.99",
      :category => "MyString"
    ))
  end

  it "renders the edit bundle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bundle_path(@bundle), "post" do
      assert_select "input#bundle_name[name=?]", "bundle[name]"
      assert_select "input#bundle_type[name=?]", "bundle[type]"
      assert_select "input#bundle_amount[name=?]", "bundle[amount]"
      assert_select "input#bundle_category[name=?]", "bundle[category]"
    end
  end
end
