require 'spec_helper'

describe Audit do
  before :each do
    @project = FactoryGirl.create(:project)
    @audit = FactoryGirl.create(:audit, project: @project)
  end
  
  it "should correct return local_repository_path" do
    @audit.local_repository_path.should == Rails.root.join("repos/#{@audit.id}")
  end
  
  describe "parsing application" do 
    
    it "should parse application without error" do
      lambda{parse_audit(@audit)}.should_not raise_error
    end
    
    it "should set the status to queued_for_auditing" do
      parse_audit(@audit)
      @audit.queued_for_auditing?.should == true
    end
    
    it "should serialize and store everything" do
      parse_audit(@audit)
      @audit.reload
      @audit.gems.size.should == 6
      audit_gem = @audit.gems.where(name: 'rails').first
      audit_gem.name.should == "rails"
      audit_gem.version.should == "3.2.3"
      audit_gem.details.should == {:groups=>[]}
      
      @audit.configuration.keys.length.should == 4
    end
  
    it "should retrieve gem information from ruby gems" do
      GemInfo.destroy_all
      Delayed::Backend::ActiveRecord::Job.destroy_all
    
      parse_audit(@audit)
      Delayed::Backend::ActiveRecord::Job.count.should == @audit.gems.length
    end
  end
end