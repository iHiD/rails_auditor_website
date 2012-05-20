require 'spec_helper'

describe "projects/new" do
  before(:each) do
    @project = FactoryGirl.create(:project)
    assign(:project, @project)
    assign(:audit, FactoryGirl.build(:audit))
  end

  it "renders new audit form" do
    render

    rendered.should have_selector("form", :action => project_audits_path(@project), :method => "post") do
      rendered.should have_selector("input#audit_github_repository", :name => "audit[github_repository]")
      rendered.should have_selector("input#audit_github_branch", :name => "audit[github_branch]")
    end
  end
end
