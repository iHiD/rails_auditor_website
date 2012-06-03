require 'spec_helper'

describe Audit do
  
  it "should return the rails version" do 
    audit = FactoryGirl.create(:audit)
    audit.gems.create!({name: 'rails', details:{version:'3.2.1'}}, as: :internal)
    audit.rails_version.should == '3.2.1'
  end
end
