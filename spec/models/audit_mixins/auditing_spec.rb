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
  
end
