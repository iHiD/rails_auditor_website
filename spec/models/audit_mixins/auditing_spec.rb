require 'spec_helper'

describe Audit do
  
  before :each do
    @audit = FactoryGirl.create(:audit)
  end
    
  it "should set the status to completed" do
    parse_audit(@audit)
    @audit.audit
    @audit.completed?.should == true
  end
  
  it "should retrieve gem information from ruby gems" do
    GemInfo.destroy_all
    Delayed::Backend::ActiveRecord::Job.destroy_all
    
    parse_audit(@audit)
    @audit.audit
    Delayed::Backend::ActiveRecord::Job.count.should == @audit.gems.length
  end
  
end
