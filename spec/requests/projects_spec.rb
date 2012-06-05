require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      visit projects_path
      page.status_code.should be(200)
    end
  end
  describe "Creating a projects" do
    it "Creates a project" do
      project_name      = "Rails Auditor Website"
      github_repository = "ihid/rails_auditor_website"
      github_branch     = "master"
      
      visit new_project_path
      fill_in :name, with: project_name
      fill_in :github_repository, with: github_repository
      fill_in :github_branch, with: github_branch
      click_button :submit
      
      page.status_code.should be(200)
      #page.should have_selector '.notice', content: "Project was successfully created."
      #page.should have_selector '.project_bar', content: project_name
      #page.should have_selector '.github_repository', content: github_repository
      #page.should have_selector '.github_branch', content: github_branch
    end
  end
end
