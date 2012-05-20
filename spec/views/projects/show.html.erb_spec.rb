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
    rendered.should have_selector("p", content: "Name".to_s)
    rendered.should have_selector("p", content: "Github Repository".to_s)
  end
end
