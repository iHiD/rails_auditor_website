require 'spec_helper'

describe Audit::Gem do
  
  describe "gem_info record links" do
    
    it "should create a new gem_info record" do
      audit_gem = FactoryGirl.create(:audit_gem)
      audit_gem.gem_info.name.should == audit_gem.name
    end
    
    it "should link to an existing gem_info record" do
      gem_info = FactoryGirl.create(:gem_info, name: 'rails')
      audit_gem = FactoryGirl.create(:audit_gem, name: 'rails')
      audit_gem.gem_info.id.should == gem_info.id
    end
    
    it "should trigger a gem info retrieval" do
      GemInfo.any_instance.should_receive(:retrieve).once
      audit_gem = FactoryGirl.create(:audit_gem)
    end
    
    it "should convert to hash correctly" do
      gem_info = FactoryGirl.create(:gem_info, name: 'rails')
      audit_gem = FactoryGirl.create(:audit_gem, name: 'rails')
      audit_gem.to_hash.should == {:id=>audit_gem.id, :name=>"rails", :version=>"3.2.3", :gem_info=>{:info => "Some info.", :version=>"3.2.3"}}
    end
  end
end
