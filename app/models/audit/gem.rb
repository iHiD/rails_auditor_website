# = Audit Gem
# 
# A record of the gem that has been found during an audit.
class Audit::Gem < ActiveRecord::Base
  attr_accessible :name, :version, :details, as: :internal
  
  belongs_to :audit
  has_one :project, through: :audit
  belongs_to :gem_info
  
  serialize :details
  
  before_create do
    self.gem_info = GemInfo.retrieve(name)
    true
  end
  
  def to_hash
    {
      id: self.id,
      name: self.name,
      version: self.version,
      gem_info: {
        info: gem_info.info,
        version: gem_info.version
      }
    }
  end
  
end
