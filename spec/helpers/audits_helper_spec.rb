require 'spec_helper'

describe AuditsHelper do
  
  describe "audit_json" do
    it "should return correct json" do
      audit = FactoryGirl.create(:audit)
      helper.audit_json(audit).should == "{\"id\":#{audit.id},\"status_id\":1}"
    end
  end
  
  describe "audit_gems_json" do
    it "should return correct json" do
      audit = FactoryGirl.create(:audit)
      gem_info = FactoryGirl.create(:gem_info)
      audit_gem = FactoryGirl.create(:audit_gem, audit: audit, gem_info: gem_info)
      helper.audit_gems_json(audit).should == "[{\"id\":#{audit_gem.id},\"name\":\"rails\",\"version\":\"3.2.3\"}]"
    end
  end
    
  describe "audit_progress" do
  
    before :each do 
      @audit = FactoryGirl.create(:audit)
    end
    
    it "shows initially show unchecked progress" do
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning ">Cloning</div><div class="parsing ">Parsing</div><div class="auditing ">Auditing</div></div>'
    end
    it "shows correct html for cloning" do
      @audit.status_id = Audit::Status.cloning
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning in_progress">Cloning</div><div class="parsing ">Parsing</div><div class="auditing ">Auditing</div></div>'
    end
    it "shows correct html for queued_for_parsing" do
      @audit.status_id = Audit::Status.queued_for_parsing
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning completed">Cloning</div><div class="parsing ">Parsing</div><div class="auditing ">Auditing</div></div>'
    end
    it "shows correct html for parsing" do
      @audit.status_id = Audit::Status.parsing
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning completed">Cloning</div><div class="parsing in_progress">Parsing</div><div class="auditing ">Auditing</div></div>'
    end
    it "shows correct html for queued_for_auditing" do
      @audit.status_id = Audit::Status.queued_for_auditing
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning completed">Cloning</div><div class="parsing completed">Parsing</div><div class="auditing ">Auditing</div></div>'
    end
    it "shows correct html for auditing" do
      @audit.status_id = Audit::Status.auditing
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning completed">Cloning</div><div class="parsing completed">Parsing</div><div class="auditing in_progress">Auditing</div></div>' 
    end
    it "shows correct html for completed" do
      @audit.status_id = Audit::Status.completed
      helper.audit_progress(@audit).should == '<div class="audit_progress"><div class="cloning completed">Cloning</div><div class="parsing completed">Parsing</div><div class="auditing completed">Auditing</div></div>'
    end
  end
end
