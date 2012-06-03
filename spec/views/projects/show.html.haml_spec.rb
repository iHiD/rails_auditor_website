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
  
  it "should show a processing message and info box when processing audit" do
    FactoryGirl.create(:audit, { project_id: @project.id })
    render 
    rendered.should have_selector(".processing_audit")
    rendered.should have_selector(".audit_progress")
  end
  
  it "should show a summary when processed" do 
    audit = FactoryGirl.create(:audit, { project_id: @project.id })
    parse_audit(audit)
    audit.status_id = Audit::Status.completed
    audit.save!
    render 
    rendered.should have_selector(".audit_summary")
    rendered.should have_selector('.rails_version', content: "Rails 3.2.3")
  end
end
