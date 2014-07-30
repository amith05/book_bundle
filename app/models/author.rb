class Author < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :middlename, :name
end
