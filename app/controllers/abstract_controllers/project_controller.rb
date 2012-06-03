class AbstractControllers::ProjectController < ApplicationController
  
  before_filter :get_project
  
  layout 'projects'
  
  #self.view_paths << "/Users/iHiD/Projects/RailsAuditor/website/app/views/projects"
  
  protected
  
  # Get the project via the project_id
  # Used for all child controllers
  def get_project
    @project = Project.find(params[:project_id])
  end
  
end