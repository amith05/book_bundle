require 'spec_helper'

describe Bundle do
  context "Bundle price calculation" do
    it "return bundle price for titles present in session variable" do
      temp = []
      title1 = Factory(:title,:mrp => 500)
      title2 = Factory(:title,:mrp => 400)
      title3 = Factory(:title,:mrp => 100)
      title4 = Factory(:title,:mrp => 500)
      title5 = Factory(:title,:mrp => 200)
      title6 = Factory(:title,:mrp => 250)
      temp << title1.id
      temp << title2.id
      temp << title3.id
      temp << title4.id
      temp << title5.id
      temp << title6.id
      bundle_price = Bundle.bundle_price_calculation(temp)
      (bundle_price % 10).should == 9
    end
  end
end
