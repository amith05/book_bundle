class Book < ActiveRecord::Base
  attr_accessible :bookno, :location, :mrp, :origlocation, :status, :title_id
end
