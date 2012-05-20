require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "",
      :github_repository => "Github Repository"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_selector("p")
    rendered.should have_selector("p")
    
    rendered.should have_selector(".audits")
    rendered.should have_selector(".no_audits")
  end
end
