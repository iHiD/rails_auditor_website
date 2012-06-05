# = Audit Gem
# 
# A record of the gem that has been found during an audit.
class Audit::Gem < ActiveRecord::Base
  attr_accessible :name, :version, :details, as: :internal
  
  belongs_to :audit
  belongs_to :gem_info
  
  serialize :details
  
  before_create do
    self.gem_info = GemInfo.retrieve(name)
    true
  end
  
end
