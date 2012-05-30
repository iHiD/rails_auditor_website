require 'spec_helper'

describe Audit do
  
  before :each do
    @audit = FactoryGirl.create(:audit)
  end
  
  describe "status" do
    
    it "should be :queued by default" do
      @audit.should be_queued
    end
    
    it "should call run_audit when processing" do
      @audit.run
    end
    
    it "should change state when processing" do
      pending "Find a good way to test this..."
      @audit.stub(:run_audit) {false}
      @audit.run
      @audit.reload
      @audit.should be_processing
    end
    
    it "should move through processing to completed" do
      @audit.run
      @audit.reload
      @audit.should be_completed
    end
    
    it "should mark as completed when run_audit is finished" do
      @audit.run
      @audit.should be_completed
    end
  end
end
