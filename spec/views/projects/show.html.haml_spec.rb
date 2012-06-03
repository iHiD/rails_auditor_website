require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = FactoryGirl.create(:project)
  end
  
  it "show no audits" do
    render 
    rendered.should have_selector(".no_audits")
    rendered.should have_selector("input[type=submit]", value: "Run your first audit")
  end
  
  describe "shows processing audit" do
    it "shows processing message" do
      FactoryGirl.create(:audit, { project_id: @project.id })
      render 
      rendered.should have_selector(".processing_audit")
      rendered.should have_selector(".audit_progress")
    end
  end
end
