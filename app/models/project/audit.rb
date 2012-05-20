class Project::Audit < ActiveRecord::Base
  
  self.table_name = 'project_audits'
  
  belongs_to :project
end
