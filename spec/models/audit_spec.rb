require 'spec_helper'

describe Audit do
  
  before :each do
    @audit = FactoryGirl.create(:audit)
  end
  
  describe "status" do
    
    it "should be queued by default" do
      @audit.should be_queued
    end
    
    it "should change status to processing when processing" do
      pending "Find a good way to test this..."
      @audit.stub(:clone) {false}
      @audit.clone
      @audit.reload
      @audit.should be_cloning
    end
    
    it "should change status to cloned when cloned" do
      @audit.clone
      @audit.reload
      @audit.should be_cloned
    end
    
    it "should change status to processing when processing" do
      pending "Find a good way to test this..."
      @audit.stub(:process) {false}
      @audit.process
      @audit.reload
      @audit.should be_processing
    end
    
    it "should move through processing to completed" do
      @audit.process
      @audit.reload
      @audit.should be_completed
    end
    
    it "should mark as completed when run_audit is finished" do
      @audit.process
      @audit.should be_completed
    end
    
    it "should correctly return ? methods" do
      @audit.status_id = Audit::Status.queued
      @audit.should be_queued
      @audit.status_id = Audit::Status.cloning
      @audit.should be_cloning
      @audit.status_id = Audit::Status.cloned
      @audit.should be_cloned
      @audit.status_id = Audit::Status.processing
      @audit.should be_processing
      @audit.status_id = Audit::Status.completed
      @audit.should be_completed
    end
  end
end
