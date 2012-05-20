class Audit < ActiveRecord::Base
  
  self.table_name = 'project_audits'
  
  attr_accessible :github_repository, :github_branch 
  
  belongs_to :project
end
