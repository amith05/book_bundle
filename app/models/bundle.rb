class Bundle < ActiveRecord::Base
  attr_accessible :amount, :category, :name, :type
  DISCOUNT_ON_BUNDLE = 40
  class << self
    def bundle_price_calculation(titles)
      bundle_price = 0.0
      titles.each do |t|
        t = Title.find(t)
        bundle_price += t.mrp
      end
      bundle_price = ((bundle_price - (bundle_price * Bundle::DISCOUNT_ON_BUNDLE.to_f/100))/2).ceil
      temp = (bundle_price % 50)
      if temp == 0
        bundle_price = bundle_price - 1
      else
        bundle_price = bundle_price + (50 - temp) - 1
      end
      bundle_price
    end
  end
end
