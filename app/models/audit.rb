class Audit < ActiveRecord::Base
  
  attr_accessible :github_repository, :github_branch 
  
  belongs_to :project
  
end
