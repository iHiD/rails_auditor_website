require 'spec_helper'

describe "audits/show" do
  before(:each) do
    @project = FactoryGirl.create(:project)
    @audit = FactoryGirl.create(:audit, project: @project)
    assign(:project, @project)
    assign(:audit, @audit)
  end

  it "shows audit id" do
    render
    rendered.should have_selector("h3", text: "Audit ##{@audit.id}")
  end

  it "shows audit status" do
    render
    rendered.should have_selector(".status", text: "Queued")
  end
end
