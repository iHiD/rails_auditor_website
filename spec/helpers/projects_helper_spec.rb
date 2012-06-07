require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProjectsHelper. For example:
#
# describe ProjectsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ProjectsHelper do
  
  describe "project_json" do
    it "should return basic details without audit" do
      project = FactoryGirl.create(:project)
      helper.project_json(project).should == "{\"github_branch\":\"master\",\"github_repository\":\"ihid/rails_auditor_website\",\"id\":#{project.id},\"name\":\"Website\"}"
    end
    it "should return basic details and last audit" do
      project = FactoryGirl.create(:project)
      audit = FactoryGirl.create(:audit, project: project)
      helper.project_json(project).should == "{\"github_branch\":\"master\",\"github_repository\":\"ihid/rails_auditor_website\",\"id\":#{project.id},\"name\":\"Website\"}"
    end
  end
  
end
