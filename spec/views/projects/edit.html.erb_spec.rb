require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "",
      :github_repository => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should have_selector("form", :action => projects_path(@project), :method => "post") do
      rendered.should have_selector("input#project_name", :name => "project[name]")
      rendered.should have_selector("input#project_github_repository", :name => "project[github_repository]")
    end
  end
end
