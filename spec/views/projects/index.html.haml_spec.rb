require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :name => "",
        :github_repository => "Github Repository"
      ),
      stub_model(Project,
        :name => "",
        :github_repository => "Github Repository"
      )
    ])
  end

  it "renders a list of projects" do
    render
    rendered.should have_selector(".project", :content => "Name".to_s, :count => 2)
  end
end
