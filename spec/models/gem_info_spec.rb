require 'spec_helper'

describe GemInfo do
  
  describe "it should retrieve_without_delay information from rubygems" do
    
    before :each do
      GemInfo.destroy_all
      @name    = "rails"
      @version = '3.2.3'
      @info    = 'test info'
      Gems.stub(:info).and_return({'name' => @name, 'version' => @version, "info" => @info})
    end
    
    it "should retrieve_without_delay get the information" do
      gem_info = GemInfo.send :retrieve_without_delay, 'rails'
      gem_info.name.should == @name
      gem_info.version.should == @version
      gem_info.info.should == @info
    end
    it "should not create duplicates" do
      gem_info_1 = GemInfo.retrieve_without_delay('rails')
      gem_info_2 = GemInfo.retrieve_without_delay('rails')
      gem_info_1.id.should == gem_info_2.id
    end
    it "should check to update the record if it's not been checked in the last hour" do
      Gems.should_receive(:info).twice
      
      gem_info = GemInfo.retrieve_without_delay('rails')
      gem_info.updated_at = DateTime.now.utc - (1.hour + 1.minute)
      gem_info.save!
      GemInfo.retrieve_without_delay('rails')
    end
    it "should not check to update the record if it's been checked in the last hour" do
      Gems.should_receive(:info).once
      
      GemInfo.retrieve_without_delay('rails')
      GemInfo.retrieve_without_delay('rails')
    end
    
    it "should automatically queue the request" do
      GemInfo.retrieve('rails').class.should == Delayed::Backend::ActiveRecord::Job
    end
  end
  
end
