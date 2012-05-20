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
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Github Repository".to_s, :count => 2
  end
end
