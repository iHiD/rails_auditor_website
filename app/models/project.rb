class Project < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :audits

end
