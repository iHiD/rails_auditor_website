require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = FactoryGirl.create(:project)
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_selector("p")
    rendered.should have_selector("p")
    
    rendered.should have_selector(".audits")
    rendered.should have_selector(".no_audits")
  end
  
  it "shows audits" do
    audit1 = FactoryGirl.create(:audit, { project_id: @project.id })
    audit2 = FactoryGirl.create(:audit, { project_id: @project.id })
    render 
    rendered.should have_selector(".audits")
    rendered.should_not have_selector(".no_audits")
    rendered.should have_selector("#audit_#{audit1.id}")
    rendered.should have_selector("#audit_#{audit1.id} .trigger")
    rendered.should have_selector("#audit_#{audit1.id} .created_at")
    rendered.should have_selector("#audit_#{audit1.id} .status")
  end
end
