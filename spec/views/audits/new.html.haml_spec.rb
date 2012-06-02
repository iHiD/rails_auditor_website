require 'spec_helper'

describe "audits/new" do
  before(:each) do
    @project = FactoryGirl.create(:project)
    assign(:project, @project)
    assign(:audit, FactoryGirl.build(:audit))
  end

  it "renders new audit form" do
    render

    rendered.should have_selector("form", :action => project_audits_path(@project), :method => "post") do
    end
  end
end