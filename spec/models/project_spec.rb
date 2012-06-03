require 'spec_helper'

describe Project do
  
  describe "most recent audit" do
    it "should return most recent audit" do
      @project = FactoryGirl.create(:project)
      audit1 = FactoryGirl.create(:audit, project: @project)
      audit2 = FactoryGirl.create(:audit, project: @project)
      audit3 = FactoryGirl.create(:audit, project: @project)
      @project.reload
    
      @project.most_recent_audit.should == audit3
    end
    
    it "should raise an exception if there is no most recent audit" do
      @project = FactoryGirl.create(:project)
      lambda{@project.most_recent_audit}.should raise_error(Project::NoAuditError)
    end
  end
    
  it "should calculate audited? correctly" do
    @project = FactoryGirl.create(:project)
    @project.audited?.should == false

    FactoryGirl.create(:audit, project: @project)
    @project.reload
    @project.audited?.should == true
  end
  
end
