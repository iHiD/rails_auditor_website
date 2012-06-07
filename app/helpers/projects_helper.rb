module ProjectsHelper
  
  def project_json(project)
    project.to_json(only: [:id, :name, :github_repository, :github_branch])
  end
  
end
