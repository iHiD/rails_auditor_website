require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "",
      :github_repository => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    rendered.should have_selector("form", :action => projects_path, :method => "post") do
      rendered.should have_selector("input#project_name", :name => "project[name]")
      rendered.should have_selector("input#project_github_repository", :name => "project[github_repository]")
      rendered.should have_selector("input#project_github_branch", :name => "project[github_branch]")
    end
  end
end
