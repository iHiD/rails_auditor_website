class Project < ActiveRecord::Base
  
  attr_accessible :name, :github_repository, :github_branch 
  
  has_many :audits

end
