require 'spec_helper'

describe "audits/show" do
  before(:each) do
    @project = FactoryGirl.create(:project)
    assign(:project, @project)
    assign(:audit, FactoryGirl.create(:audit))
  end

  it "shows audit status" do
    render
    rendered.should have_selector(".status", text: "Queued")
  end
end
