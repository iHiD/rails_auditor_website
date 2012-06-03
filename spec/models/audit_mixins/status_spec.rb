require 'spec_helper'

describe Audit do
  
  before :each do
    @audit = FactoryGirl.create(:audit)
  end
  
  it "should be queued by default" do
    @audit.should be_queued_for_cloning
  end
  
  it "should change status to queued_for_parsing when cloned" do
    @audit.clone_repository
    @audit.reload
    @audit.queued_for_parsing?.should == true
  end
  
  it "should move through processing to completed" do
    @audit.audit
    @audit.reload
    @audit.completed?.should == true
  end
  
  it "should correctly return ? methods" do
    @audit.status_id = Audit::Status.queued_for_cloning
    @audit.queued_for_cloning?.should == true
    
    @audit.status_id = Audit::Status.cloning
    @audit.cloning?.should == true 
    
    @audit.status_id = Audit::Status.queued_for_parsing
    @audit.queued_for_parsing?.should == true
    
    @audit.status_id = Audit::Status.parsing
    @audit.parsing?.should == true
    
    @audit.status_id = Audit::Status.queued_for_auditing
    @audit.queued_for_auditing?.should == true
    
    @audit.status_id = Audit::Status.auditing
    @audit.auditing?.should == true
    
    @audit.status_id = Audit::Status.completed
    @audit.should be_completed
  end
end
