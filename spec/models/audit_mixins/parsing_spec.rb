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
    before :each do 
      FileUtils.cp_r(Rails.root.join("spec/applications/default_3_2_3"), @audit.local_repository_path)
    end
    after :each do 
      FileUtils.rmdir(@audit.local_repository_path)
    end
    
    it "should parse application without error" do
      lambda{@audit.parse}.should_not raise_error
    end
    
    it "should set the status to queued_for_auditing" do
      @audit.parse
      @audit.queued_for_auditing?.should == true
    end
    
    it "should serialize and store everything" do
      @audit.parse
      @audit.reload
      @audit.gems.keys.length.should == 6
      @audit.configuration.keys.length.should == 4
    end
  end
end