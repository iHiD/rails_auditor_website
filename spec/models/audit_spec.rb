require 'spec_helper'

describe Audit do
  
  describe "status" do
    before :each do 
      @audit = FactoryGirl.create(:audit)
    end
    
    it "should be :queued by default" do
      @audit.should be_queued
    end
    
    it "should change state when processing" do
      @audit.process
      @audit.reload
      @audit.should be_processing
    end
    
    it "should change state when completed" do
      @audit.process
      @audit.complete
      @audit.reload
      @audit.should be_completed
    end
  end
end
